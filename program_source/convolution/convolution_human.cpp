#include "hls_stream.h"

#include <stdio.h>
#include <string.h>

#define MAX_IMAGE_WIDTH     1920
#define MAX_IMAGE_HEIGHT    1080
#define FILTER_V_SIZE		15
#define FILTER_H_SIZE		15
#ifndef MIN
#define MIN(a,b) ((a<b)?a:b)
#endif
#ifndef MAX
#define MAX(a,b) ((a<b)?b:a)
#endif

typedef unsigned char      		U8;
typedef unsigned short     		U16;
typedef unsigned int       		U32;

typedef signed char        		I8;
typedef signed short       		I16;
typedef signed int         		I32;

void ReadFromMem(
        unsigned short       width,
        unsigned short       height,
        unsigned short       stride,
        const char          *coeffs,
        hls::stream<char>   &coeff_stream,
        const unsigned char *src,
        hls::stream<U8>     &pixel_stream )
{
    unsigned num_coefs = 15*15; //FILTER_V_SIZE*FILTER_H_SIZE;
    unsigned num_coefs_padded = (((num_coefs-1)/64)+1)*64; // Make sure number of reads of multiple of 64, enables auto-widening
L1:    read_coefs: for (int i=0; i< 288/*num_coefs_padded*/; i++) {
        U8 coef = coeffs[i];
        if (i<num_coefs) coeff_stream.write( coef );        
    }

    stride = (stride/64)*64; // Makes compiler see that stride is a multiple of 64, enables auto-widening
    unsigned offset = 0;
    unsigned x = 0;
L2:    read_image: for (int n = 0; n < 1920*1080 /*height*stride*/; n++) {
        U8 pix = src[n];
        if (x<width) pixel_stream.write( pix );
        if (x==(stride-1)) x=0; else x++;
     }
}


void WriteToMem(
        unsigned short       width,
        unsigned short       height,
        unsigned short       stride,
        hls::stream<U8>     &pixel_stream,
        unsigned char       *dst)
{

    stride = (stride/64)*64; // Makes compiler see that stride is a multiple of 64, enables auto-widening
    unsigned offset = 0;
    unsigned x = 0;
L3:    write_image: for (int n = 0; n < 1920*1080/*height*stride*/; n++) {
        U8 pix = (x<width) ? pixel_stream.read() : 0;
        dst[n] = pix;
        if (x==(stride-1)) x=0; else x++;
    }    
}


struct window {
    U8 pix[FILTER_V_SIZE][FILTER_H_SIZE];
};


void Window2D(
        unsigned short        width,
        unsigned short        height,
        hls::stream<U8>      &pixel_stream,
        hls::stream<window>  &window_stream)
{
    // Line buffers - used to store [FILTER_V_SIZE-1] entire lines of pixels
L4:    U8 LineBuffer[FILTER_V_SIZE-1][MAX_IMAGE_WIDTH];  
#pragma HLS DEPENDENCE variable=LineBuffer inter false
#pragma HLS DEPENDENCE variable=LineBuffer intra false

    // Sliding window of [FILTER_V_SIZE][FILTER_H_SIZE] pixels
    window Window;

    unsigned col_ptr = 0;
    unsigned ramp_up = 1920*((FILTER_V_SIZE-1)/2)+(FILTER_H_SIZE-1)/2; //width*((FILTER_V_SIZE-1)/2)+(FILTER_H_SIZE-1)/2;
    unsigned num_pixels = 1920*1080;//width*height;
    unsigned num_iterations = num_pixels + ramp_up;

    const unsigned max_iterations = MAX_IMAGE_WIDTH*MAX_IMAGE_HEIGHT + MAX_IMAGE_WIDTH*((FILTER_V_SIZE-1)/2)+(FILTER_H_SIZE-1)/2;

    // Iterate until all pixels have been processed
L5:    update_window: for (int n=0; n< 2087054/*num_iterations*/; n++)
    {
#pragma HLS LOOP_TRIPCOUNT max=max_iterations

        // Read a new pixel from the input stream
        U8 new_pixel = (n<num_pixels) ? pixel_stream.read() : 0;

        // Shift the window and add a column of new pixels from the line buffer
L6:        for(int i = 0; i < FILTER_V_SIZE; i++) {
L7:            for(int j = 0; j < FILTER_H_SIZE-1; j++) {
                Window.pix[i][j] = Window.pix[i][j+1];
            }
            Window.pix[i][FILTER_H_SIZE-1] = (i<FILTER_V_SIZE-1) ? LineBuffer[i][col_ptr] : new_pixel;
        }

        // Shift pixels in the column of pixels in the line buffer, add the newest pixel
L8:        for(int i = 0; i < FILTER_V_SIZE-2; i++) {
            LineBuffer[i][col_ptr] = LineBuffer[i+1][col_ptr];
        }
        LineBuffer[FILTER_V_SIZE-2][col_ptr] = new_pixel;

        // Update the line buffer column pointer
        if (col_ptr==(width-1)) {
            col_ptr = 0;
        } else {
            col_ptr++;
        }

        // Write output only when enough pixels have been read the buffers and ramped-up
        if (n>=ramp_up) {
            window_stream.write(Window);
        }

    }
}

void Filter2D(
        unsigned short       width,
        unsigned short       height,
        float                factor,
        short                bias,
        hls::stream<char>   &coeff_stream,
        hls::stream<window> &window_stream,
		hls::stream<U8>     &pixel_stream )
{

    // Filtering coefficients
L9:    char coeffs[FILTER_V_SIZE][FILTER_H_SIZE];

    // Load the coefficients into local storage
L10:    load_coefs: for (int i=0; i<FILTER_V_SIZE; i++) {
L11:        for (int j=0; j<FILTER_H_SIZE; j++) {
            coeffs[i][j] = coeff_stream.read();
        }
    }

    // Process the incoming stream of pixel windows
L12:    apply_filter: for (int y = 0; y < 1080/*height*/; y++) 
    {
L13:        for (int x = 0; x < 1920/*width*/; x++) 
        {
            // Read a 2D window of pixels
            window w = window_stream.read();

            // Apply filter to the 2D window
            int sum = 0;
L14:            for(int row=0; row<FILTER_V_SIZE; row++) 
            {
L15:                for(int col=0; col<FILTER_H_SIZE; col++) 
                {
                    unsigned char pixel;
                    int xoffset = (x+col-(FILTER_H_SIZE/2));
                    int yoffset = (y+row-(FILTER_V_SIZE/2));
                    // Deal with boundary conditions : clamp pixels to 0 when outside of image 
                    if ( (xoffset<0) || (xoffset>=width) || (yoffset<0) || (yoffset>=height) ) {
                        pixel = 0;
                    } else {
                        pixel = w.pix[row][col];
                    }
                    sum += pixel*(char)coeffs[row][col];
                }
            }

            // Normalize result
            unsigned char outpix = MIN(MAX((int(factor * sum)+bias), 0), 255);

            // Write the output pixel
            pixel_stream.write(outpix);
        }
    }
}


void convolution(
        const char           coeffs[256],
        float                factor,
        short                bias,
        unsigned short       width,
        unsigned short       height,
        unsigned short       stride,
        const unsigned char  src[MAX_IMAGE_WIDTH*MAX_IMAGE_HEIGHT],
        unsigned char        dst[MAX_IMAGE_WIDTH*MAX_IMAGE_HEIGHT])
  {
            
#pragma HLS DATAFLOW

	// Stream of pixels from kernel input to filter, and from filter to output
    hls::stream<char,2>    coefs_stream;
    hls::stream<U8,2>      pixel_stream;
    hls::stream<window,3>  window_stream; // Set FIFO depth to 0 to minimize resources
    hls::stream<U8,64>     output_stream;

	// Read image data from global memory over AXI4 MM, and stream pixels out
    ReadFromMem(width, height, stride, coeffs, coefs_stream, src, pixel_stream);

    // Read incoming pixels and form valid HxV windows
    Window2D(width, height, pixel_stream, window_stream);

	// Process incoming stream of pixels, and stream pixels out
	Filter2D(width, height, factor, bias, coefs_stream, window_stream, output_stream);

	// Write incoming stream of pixels and write them to global memory over AXI4 MM
	WriteToMem(width, height, stride, output_stream, dst);

  }
