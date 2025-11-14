#!/bin/bash
source "$(dirname "$0")/utils.sh"

TEMPLATE="$(dirname "$0")/../systemd/fbcp.service.template"
SERVICE="/etc/systemd/system/fbcp.service"

info "Instalando serviço systemd..."

sudo cp "$TEMPLATE" "$SERVICE"

sudo systemctl daemon-reload
sudo systemctl enable fbcp
sudo systemctl restart fbcp

success "Service fbcp instalado e rodando!"
