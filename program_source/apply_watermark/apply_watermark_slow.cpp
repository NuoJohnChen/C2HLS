
#include <iostream>
// Water Mark Defines
#define CHANNELS 3 // Three Channels (R, G and B)
#define WATERMARK_HEIGHT 16
#define WATERMARK_WIDTH 16

// Per Memory Access getting 16 pixels
#define DATA_SIZE 16
typedef unsigned int uint;

// Using structure to get the full memory datawidth 512
typedef struct TYPE { uint data[DATA_SIZE]; } TYPE;

// Tripcount identifiers
const int c_size = DATA_SIZE;

// function declaration
int saturatedAdd(int x, int y);

extern "C" {
void apply_watermark(const TYPE* input, TYPE* output, int width, int height) {
    // WaterMark Image of 16x16 size
    int watermark[WATERMARK_HEIGHT][WATERMARK_WIDTH] = {
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0x0f0f0f, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x0f0f0f, 0},
        {0, 0, 0x0f0f0f, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x0f0f0f, 0, 0},
        {0, 0, 0, 0x0f0f0f, 0, 0, 0, 0, 0, 0, 0, 0, 0x0f0f0f, 0, 0, 0},
        {0, 0, 0, 0, 0x0f0f0f, 0, 0, 0, 0, 0, 0, 0x0f0f0f, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0x0f0f0f, 0, 0, 0, 0, 0x0f0f0f, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0x0f0f0f, 0, 0, 0x0f0f0f, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0x0f0f0f, 0x0f0f0f, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0x0f0f0f, 0x0f0f0f, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0x0f0f0f, 0, 0, 0x0f0f0f, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0x0f0f0f, 0, 0, 0, 0, 0x0f0f0f, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0x0f0f0f, 0, 0, 0, 0, 0, 0, 0x0f0f0f, 0, 0, 0, 0},
        {0, 0, 0, 0x0f0f0f, 0, 0, 0, 0, 0, 0, 0, 0, 0x0f0f0f, 0, 0, 0},
        {0, 0, 0x0f0f0f, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x0f0f0f, 0, 0},
        {0, 0x0f0f0f, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x0f0f0f, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    };

    uint imageSize = width * height; // Total Number of Pixels
    // As memory access is int16 type so total 16 pixels can be access at a time,
    // so calculating total number of Memory accesses which are needed to entire
    // Image
    uint size = ((imageSize - 1) / DATA_SIZE) + 1;

// Process the whole image
// Auto-pipeline is going to apply pipeline to this loop
image_traverse:
    for (uint idx = 0, x = 0, y = 0; idx < size; ++idx) {
        #pragma HLS LOOP_TRIPCOUNT min = 31568 max = 31568
        // Read the next 16 Pixels
        TYPE tmp = input[idx];

        // Row Boundary Check for x
        if (x >= width) {
            x = x - width;
            ++y;
        }

        for (int i = 0; i < DATA_SIZE; i++, x++) {
            #pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
            // Row Boundary Check for x
            if (x > width) {
                x = x - width;
                y += 1;
            }

            uint w_idy = y % WATERMARK_HEIGHT;
            uint w_idx = x % WATERMARK_WIDTH;
            tmp.data[i] = saturatedAdd(tmp.data[i], watermark[w_idy][w_idx]);
        }
        output[idx] = tmp;
        std::cout << ". ";
    }
}
}

int saturatedAdd(int x, int y) {
    // Separate into the different channels

    // Red Channel
    int redX = x & 0xff;
    int redY = y & 0xff;
    int redOutput;

    // Green Channel
    int greenX = (x & 0xff00) >> 8;
    int greenY = (y & 0xff00) >> 8;
    int greenOutput;

    // Blue Channel
    int blueX = (x & 0xff0000) >> 16;
    int blueY = (y & 0xff0000) >> 16;
    int blueOutput;

    // Calculating Red
    if (redX + redY > 255) {
        redOutput = 255;
    } else {
        redOutput = redX + redY;
    }

    // Calculating Green
    if (greenX + greenY > 255) {
        greenOutput = 255;
    } else {
        greenOutput = greenX + greenY;
    }

    // Calculating Blue
    if (blueX + blueY > 255) {
        blueOutput = 255;
    } else {
        blueOutput = blueX + blueY;
    }

    // Combining all channels into one
    int combinedOutput = 0;
    combinedOutput |= redOutput;
    combinedOutput |= (greenOutput << 8);
    combinedOutput |= (blueOutput << 16);
    return combinedOutput;
}
