#!/bin/bash
source "$(dirname "$0")/utils.sh"

TEMPLATE="$(dirname "$0")/../systemd/fbcp.service.template"
SERVICE="/etc/systemd/system/fbcp.service"

info "Installing systemd service..."

sudo cp "$TEMPLATE" "$SERVICE"

sudo systemctl daemon-reload
sudo systemctl enable fbcp
sudo systemctl restart fbcp

success "fbcp service installed and running!"
