#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

#include "utils.h"

int main() {
    int width, height, channels;
    unsigned char* data = stbi_load("assets/dog.png", &width, &height, &channels, 0);

    if (data) {
        std::cout << "load image gut: " << width << "x" << height << ", channels: " << channels << std::endl;
        stbi_image_free(data);
    } else {
        std::cerr << "error" << std::endl;
    }

    return 0;
}