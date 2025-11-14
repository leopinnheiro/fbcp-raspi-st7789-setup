#!/bin/bash
source "$(dirname "$0")/utils.sh"

info "Baixando seu fork do fbcp-ili9341..."

# Troque AQUI pela URL do seu fork:
FBCP_URL="https://github.com/leopinnheiro/fbcp-ili9341.git"

if [ ! -d fbcp-ili9341 ]; then
    git clone "$FBCP_URL"
else
    warn "fbcp-ili9341 já existe, atualizando..."
    cd fbcp-ili9341 && git pull && cd ..
fi

cd fbcp-ili9341
mkdir -p build && cd build

# Inputs interativos
GPIO_DC=$(ask "GPIO TFT Data/Control" "25")
GPIO_RST=$(ask "GPIO TFT Reset" "24")
SPI_DIV=$(ask "SPI Clock Divisor" "4")

info "Rodando CMake..."

cmake -DST7789=ON \
      -DGPIO_TFT_DATA_CONTROL="$GPIO_DC" \
      -DGPIO_TFT_RESET_PIN="$GPIO_RST" \
      -DUSE_DMA_TRANSFERS=ON \
      -DSPI_BUS_CLOCK_DIVISOR="$SPI_DIV" \
      -DDISPLAY_ROTATE_180_DEGREES=ON \
      -DDISPLAY_CROPPED_INSTEAD_OF_SCALING=ON \
      -DSTATISTICS=0 ..

info "Compilando..."
make -j4

sudo cp fbcp-ili9341 /usr/local/bin/

success "fbcp-ili9341 instalado!"
