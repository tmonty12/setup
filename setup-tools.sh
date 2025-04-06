#!/bin/bash

usage() {
    echo "Usage: $0 [--ai]"
    echo "Options:"
    echo "  --ai    Install AI tools (cgpt)"
    exit 1
}

# Check if help is requested
if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    usage
fi

# Git Configuration
setup_git() {
    echo "Checking Git configuration..."
    current_name=$(git config --global user.name)
    current_email=$(git config --global user.email)
    
    if [[ "$current_name" != "ishandhanani" || "$current_email" != "ishandhanani@gmail.com" ]]; then
        echo "Setting up Git configuration..."
        git config --global user.name "ishandhanani"
        git config --global user.email "ishandhanani@gmail.com"
        echo "Git config set successfully!"
        echo "Please set GPG key to enable signed commits"
    else
        echo "Git already configured correctly."
    fi
}

# Programming Languages and Tools
setup_languages() {
    echo "Checking programming languages and package managers..."
    
    # Go installation check
    if ! command -v go &> /dev/null; then
        echo "Installing Go..."
        sudo snap install go --classic
    else
        echo "Go is already installed."
    fi
    
    # Python UV check
    if ! command -v uv &> /dev/null; then
        echo "Installing UV (Python package manager)..."
        curl -LsSf https://astral.sh/uv/install.sh | sh
    else
        echo "UV is already installed."
    fi

    # Install bat 
    if ! command -v bat &> /dev/null; then
        echo "Installing bat..."
        sudo apt install bat
    else
        echo "bat is already installed."
    fi

    # Install cgpt optional if --ai flag is provided
    if [[ "$1" == "--ai" ]]; then
        echo "Installing cgpt..."
        go install github.com/tmc/cgpt/cmd/cgpt@latest
        cgpt --version
        echo "cgpt installed successfully."
    else
        echo "cgpt is already installed."
    fi
}

# Main execution
main() {
    setup_git
    setup_languages
    
    echo "Setup complete!"
}

main