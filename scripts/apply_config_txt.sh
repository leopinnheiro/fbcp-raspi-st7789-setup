#!/bin/bash
source "$(dirname "$0")/utils.sh"

SAMPLE="$(dirname "$0")/../config/config.txt.sample"
TARGET="/boot/config.txt"

info "Applying clean config.txt for framebuffer compatibility"

# Backup
if [ -f "$TARGET" ]; then
    BACKUP="${TARGET}.bak"
    sudo cp "$TARGET" "$BACKUP"
    success "Backup created: $BACKUP"
fi

# Replace
sudo cp "$SAMPLE" "$TARGET"
success "Replaced $TARGET with clean sample configuration."

info "Done! Reboot required."
