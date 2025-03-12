#!/bin/bash

echo "Installing Stable Diffusion WebUI and ControlNet on Mac..."

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install dependencies
brew install git python@3.10

# Clone Stable Diffusion WebUI
echo "Cloning Stable Diffusion WebUI..."
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
cd stable-diffusion-webui

# Enable Apple MPS acceleration
echo "Enabling Apple GPU acceleration..."
echo 'export COMMANDLINE_ARGS="--use-mps"' >> webui-user.sh

# Run initial setup
echo "Setting up dependencies (this may take a while)..."
./webui.sh

# Install ControlNet extension
echo "Installing ControlNet..."
cd extensions
git clone https://github.com/Mikubill/sd-webui-controlnet.git
cd ..

# Restart WebUI to apply changes
echo "Restarting WebUI..."
./webui.sh

echo "Installation complete! Open http://127.0.0.1:7860/ in your browser."
