# Personal Installation Configuration
# Author: Francisco Cornejo-Garcia

# System Preferences -----------------------------------------------------------
read -sp $'Go to System Preferences\n'
read -sp $'Go to General to set dark mode\n'
read -sp $'Go to Desktop & Screen Saver to set black background\n'
read -sp $'Go to Dock & Menu Bar to hide them\n'
read -sp $'Go to Users & Groups to change profile picture\n'
read -sp $'Go to iCloud to sync and set up Documents\n'
read -sp $'Go to Notifications to turn them all off\n'
read -sp $'Go back to Terminal\n'

# Software Installation --------------------------------------------------------
echo 'Installing Xcode Command Line Tools...'
# xcode-select --install

echo 'Installing Homebrew...'
if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

echo 'Installing packages by Homebrew...'
# Maybe: microsoft-word/excel/powerpoint, intellij-idea
packages=(
    alacritty
    brave-browser
    discord
    git
    hammerspoon
    neovim
    slack
    syncthing
    tmux
    zoom
    zsh
    z
    amazon-music
)

for package in ${packages[@]}; do
    brew install $package
done

echo 'Starting syncthing...'
brew services start syncthing

read -sp $'Install Wally\n'
