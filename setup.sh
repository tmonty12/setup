#!/bin/bash

# Set git config
git config --global user.name "ishandhanani"
git config --global user.email "ishandhanani@gmail.com"
echo "Git config set successfully!"

# Install go
sudo snap install go --classic

# Install uv for python
curl -LsSf https://astral.sh/uv/install.sh | sh

# Setup Vim with jellybeans theme
mkdir -p ~/.vim/colors
cd ~/.vim/colors || exit
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim

# Create .vimrc
cat > ~/.vimrc << 'EOL'
set number
syntax on
:colorscheme jellybeans
EOL

# Install cgpt
go install github.com/tmc/cgpt/cmd/cgpt@latest

echo "Setup complete! Your prompt should be updated now."