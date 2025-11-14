#!/bin/bash
source "$(dirname "$0")/utils.sh"

CONFIG="/boot/config.txt"

info "Applying necessary changes to $CONFIG"

# Função auxiliar pra adicionar apenas se não existir
append_if_missing() {
    local key="$1"
    if ! grep -q "^$key" "$CONFIG"; then
        echo "$key" | sudo tee -a "$CONFIG" > /dev/null
        success "Added: $key"
    else
        info "Already present: $key"
    fi
}

# Habilitar SPI
append_if_missing "dtparam=spi=on"

# Ativar FKMS (legacy driver com DispmanX)
append_if_missing "dtoverlay=vc4-fkms-v3d"

# Recomendações opcionais
append_if_missing "max_framebuffers=2"
append_if_missing "disable_overscan=1"
append_if_missing "dtparam=audio=on"

success "All required configuration options have been applied!"
