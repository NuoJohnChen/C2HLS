typedef struct rgb_pixel {
    unsigned char R;
    unsigned char G;
    unsigned char B;
} rgb_pixel;

//#define MAX_HEIGHT 1080
//#define MAX_WIDTH 1920
#define MAX_HEIGHT 20
#define MAX_WIDTH 20

void video_2dfilter(rgb_pixel pixel_in[MAX_HEIGHT][MAX_WIDTH], rgb_pixel pixel_out[MAX_HEIGHT][MAX_WIDTH]);
