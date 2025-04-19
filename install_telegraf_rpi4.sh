#!/bin/bash

REPO_URL="https://github.com/YOUR_USERNAME/telegraf-rpi4-monitoring"
PKG_NAME="telegraf_rpi4_package.tar.gz"

echo "📦 Cloning config from GitHub..."
mkdir -p ~/telegraf_setup && cd ~/telegraf_setup

# Download the package from GitHub Releases or main
wget "$REPO_URL/raw/main/$PKG_NAME" -O $PKG_NAME

echo "📂 Extracting package..."
tar -xzvf $PKG_NAME

echo "🚚 Moving config and scripts..."
sudo mv telegraf.conf /etc/telegraf/
sudo mv *.sh *.py /usr/local/bin/
sudo chmod +x /usr/local/bin/*.sh /usr/local/bin/*.py

echo "🛡️ Setting up sudo rule for GPIO read script..."
if ! sudo grep -q "telegraf ALL=(ALL) NOPASSWD: /usr/local/bin/read_gpio18.py" /etc/sudoers; then
  echo "telegraf ALL=(ALL) NOPASSWD: /usr/local/bin/read_gpio18.py" | sudo tee -a /etc/sudoers
fi

echo "🔁 Restarting Telegraf..."
sudo systemctl restart telegraf

echo "✅ Installation complete. Telegraf is now running with Raspberry Pi 4 internal monitoring config."
