#!/bin/bash
source "$(dirname "$0")/utils.sh"

info "Cloning fbcp-ili9341 fork..."

# Troque AQUI pela URL do seu fork:
FBCP_URL="https://github.com/leopinnheiro/fbcp-ili9341.git"

if [ ! -d fbcp-ili9341 ]; then
    git clone "$FBCP_URL"
else
    warn "fbcp-ili9341 already exists, updating repository..."
    cd fbcp-ili9341 && git pull && cd ..
fi

cd fbcp-ili9341
mkdir -p build && cd build

# Inputs interativos
read -p "GPIO for DC (default 25): " GPIO_DC
GPIO_DC=${GPIO_DC:-25}

read -p "GPIO for RESET (default 27): " GPIO_RST
GPIO_RST=${GPIO_RST:-27}

read -p "GPIO for CS (default 8): " GPIO_CS
GPIO_CS=${GPIO_CS:-8}

read -p "SPI clock divisor (default 4): " SPI_DIV
SPI_DIV=${SPI_DIV:-4}

info "Running CMake..."

cmake -DST7789=ON \
      -DGPIO_TFT_DATA_CONTROL="$GPIO_DC" \
      -DGPIO_TFT_RESET_PIN="$GPIO_RST" \
      -DGPIO_TFT_CS_PIN="$GPIO_CS" \
      -DUSE_DMA_TRANSFERS=ON \
      -DSPI_BUS_CLOCK_DIVISOR="$SPI_DIV" \
      -DDISPLAY_ROTATE_180_DEGREES=ON \
      -DDISPLAY_CROPPED_INSTEAD_OF_SCALING=ON \
      -DSTATISTICS=0 \
      ..

info "Compiling..."
make -j4

sudo cp fbcp-ili9341 /usr/local/bin/

success "fbcp-ili9341 installed!"
