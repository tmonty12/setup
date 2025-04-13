#!/bin/bash

# Exit on any error
set -e

echo "Setting up Vim with solarized theme..."

# Create vim colors directory if it doesn't exist
mkdir -p ~/.vim/colors

# Download solarized theme
echo "Downloading solarized theme..."
curl -fLo ~/.vim/colors/solarized.vim --create-dirs https://raw.githubusercontent.com/ericbn/vim-solarized/master/colors/solarized.vim

# Create .vimrc with configuration
echo "Creating .vimrc configuration..."
cat > ~/.vimrc << 'EOL'
syntax enable
set background=light
colorscheme solarized
set termguicolors
EOL

echo "Setup complete! Your Vim is now configured with solarized theme. You can use tab to autocomplete"
