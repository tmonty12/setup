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

# First, remove any existing PS1 exports from .bashrc
sed -i '/^export PS1=/d' ~/.bashrc

# Remove zsh-related installations and configurations
# Instead, set up a git-aware PS1 for bash
cat >> ~/.bashrc << 'EOL'

# Git aware prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Colors for PS1
BLUE="\[\033[01;34m\]"
GREEN="\[\033[01;32m\]"
YELLOW="\[\033[01;33m\]"
RESET="\[\033[00m\]"

# Set PS1 with username@host, current directory, and git branch
PS1="${GREEN}\u@\h${RESET}:${BLUE}\w${YELLOW}\$(parse_git_branch)${RESET}\$ "

# Environment variables
export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY}"

# Go setup
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin

# Aliases
alias ll='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
EOL

# Source bashrc immediately
source ~/.bashrc

echo "Setup complete! Your prompt should be updated now."