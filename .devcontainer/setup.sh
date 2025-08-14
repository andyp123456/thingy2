#!/bin/bash

# Tailscale is already installed via the devcontainer feature
# Install xrdp for RDP server
sudo apt update
sudo apt install -y xrdp xfce4 xfce4-goodies

# Configure xrdp
sudo systemctl enable xrdp
sudo adduser codespace ssl-cert

# Set up desktop environment for codespace user
echo "xfce4-session" > ~/.xsession

# Configure xrdp to use xfce4
sudo sed -i 's/^test -x/#test -x/' /etc/xrdp/startwm.sh
echo "exec /usr/bin/startxfce4" | sudo tee -a /etc/xrdp/startwm.sh

# Start xrdp service
sudo systemctl start xrdp

echo "Setup complete!"
echo "To connect Tailscale:"
echo "1. Run: sudo tailscale up"
echo "2. Follow the authentication link"
echo "3. Your codespace will be available on your Tailscale network"
echo "4. Use RDP client to connect to the Tailscale IP on port 3389"
