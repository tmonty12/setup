# Setup

# Setting up a new mac

1. Install Chome/Arc
2. Download Raycast -> turn off spotlight search -> map Raycast to cmd-space
3. Change keyboard rate to fast in system settings using key repeat rate as fast and delay as short
4. `defaults write -g ApplePressAndHoldEnabled -bool false` to stop accented characters and restart computer
5. Install iTerm2
6. Install Rectangle
7. Install Cursor
   - Use the settings.json and add to user settings
8. Change cursor speed to fast in system settings

Setup zsh

```bash
curl -sSL https://raw.githubusercontent.com/tmonty12/setup/refs/heads/main/setup-zsh.sh | bash
```

# Setting up a new linux dev box

```bash
# setup bash with git aware PS1
curl -sSL https://raw.githubusercontent.com/tmonty12/setup/refs/heads/main/setup-bash.sh | bash

# setup vim
curl -sSL https://raw.githubusercontent.com/tmonty12/setup/refs/heads/main/setup-vim.sh | bash

# setup tools
curl -sSL https://raw.githubusercontent.com/tmonty12/setup/refs/heads/main/setup-tools.sh | bash
```

# Grab vim config only in a container or vm for easy dev

```bash
curl -sSL https://raw.githubusercontent.com/tmonty12/setup/refs/heads/main/setup-vim.sh | bash
```

# Current new tools

1. bat over cat
