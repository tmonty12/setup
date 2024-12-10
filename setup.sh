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

# Create config.yaml with API key
cat > ~/config.yaml << EOL
anthropicAPIKey: "${ANTHROPIC_API_KEY}"
EOL

# Setup Git-aware prompt
cat >> ~/.bashrc << 'EOL'

# Git aware prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[01;32m\]\u(ishan)\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] "
EOL

echo "Setup complete! Run 'source ~/.bashrc' to apply changes."
