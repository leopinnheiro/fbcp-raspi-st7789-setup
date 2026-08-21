#!/bin/bash
set -e

BASE_DIR="$(dirname "$0")"
SCRIPTS="$BASE_DIR/scripts"

source "$SCRIPTS/utils.sh"

echo "───────────────────────────────────────────"
echo "   Raspberry Pi ST7789 Display Installer   "
echo "───────────────────────────────────────────"

info "Instalando dependências..."
bash "$SCRIPTS/install_dependencies.sh"

info "Aplicando alterações ao config.txt..."
bash "$SCRIPTS/apply_config_txt.sh"

info "Instalando e compilando fbcp..."
bash "$SCRIPTS/install_fbcp.sh"

info "Configurando serviço systemd..."
bash "$SCRIPTS/create_service.sh"

warn "Setup concluído!"

read -p "Reiniciar agora? (Y/n): " resp
resp="${resp:-Y}"
if [[ "$resp" =~ ^[Yy]$ ]]; then
    sudo reboot
else
    success "Setup finalizado sem reboot!"
fi
