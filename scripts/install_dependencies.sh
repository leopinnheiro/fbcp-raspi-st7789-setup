#!/bin/bash
source "$(dirname "$0")/utils.sh"

info "Atualizando pacotes..."
sudo apt update
sudo apt upgrade -y

info "Instalando dependências essenciais..."
sudo apt install -y \
    git cmake build-essential \
    libsdl2-dev libsdl2-2.0-0 \
    libsdl2-image-2.0-0 libsdl2-mixer-2.0-0 libsdl2-ttf-2.0-0 \
    python3 python3-pip python3-venv

success "Dependências instaladas!"
