#!/bin/bash

# Exit on any error
set -e

echo "Setting up Vim with jellybeans theme..."

# Create vim colors directory if it doesn't exist
mkdir -p ~/.vim/colors

# Change to colors directory
cd ~/.vim/colors || exit 1

# Download jellybeans theme
echo "Downloading jellybeans theme..."
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim

# Create .vimrc with configuration
echo "Creating .vimrc configuration..."
cat > ~/.vimrc << 'EOL'
set number
syntax on
:colorscheme jellybeans
EOL

echo "Setup complete! Your Vim is now configured with jellybeans theme. You can use tab to autocomplete"
