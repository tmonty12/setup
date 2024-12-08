#!/bin/bash

# Prompt for Anthropic API key
echo "Please enter your Anthropic API key:"
read -r ANTHROPIC_API_KEY

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

# Setup Zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
fi

# Create .zshrc with Anthropic API key
cat > ~/.zshrc << EOL
# Environment variables
export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY}"

# Aliases
alias ll='ls -la'
alias ..='cd ..'
alias ...='cd ../..'

# Go setup
export GOPATH=\$HOME/go
export PATH=\$PATH:\$GOPATH/bin

# Enable command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Enable auto-completion
autoload -Uz compinit
compinit
EOL

# Install Oh My Zsh (optional)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Setup complete! Please restart your shell or run 'source ~/.zshrc' to apply changes."