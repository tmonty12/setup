#!/bin/bash

# typically used for new mac

# Create backup of existing .zshrc if it exists
if [ -f ~/.zshrc ]; then
    echo "Backing up existing .zshrc to .zshrc.backup"
    cp ~/.zshrc ~/.zshrc.backup
fi

# Fetch the .zshrc from the GitHub repository
echo "Fetching .zshrc from GitHub repository..."
curl -sSL https://raw.githubusercontent.com/ishandhanani/setup/main/.zshrc -o ~/.zshrc

# Setup Vim with jellybeans theme
mkdir -p ~/.vim/colors
cd ~/.vim/colors || exit
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim

echo "Setup complete! Run 'source ~/.zshrc' to apply changes" 