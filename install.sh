#!/usr/bin/zsh
# Personal Installation Configuration
# Author: Francisco Cornejo-Garcia

# System Preferences -----------------------------------------------------------
read -sp $'Go to System Preferences\n'
read -sp $'Go to Appearance to change color and size\n'
read -sp $'Go to Desktop & Screen Saver to set black background\n'
read -sp $'Go to Dock to hide them\n'
read -sp $'Go to Users & Groups to change profile picture\n'
read -sp $'Go to Notifications to configure them \n'
read -sp $'Go to Sound to change output and turn off sound effects\n'
read -sp $'Go back to Terminal\n'

# Defaults Settings ------------------------------------------------------------
echo 'Removing apps from the Dock...'
# how to receive yes/no control statement
defaults write com.apple.dock persistent-apps -array
killall Dock

# Software Installation --------------------------------------------------------
echo 'Installing Xcode Command Line Tools...'
xcode-select --install

echo 'Installing Homebrew...'
# do the below only on a work machine
if test ! $(which brew); then
    mkdir -p $HOME/homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/homebrew
    eval "$($HOME/homebrew/bin/brew shellenv)"
fi
chmod -R go-w "$(brew --prefix)/share/zsh"

# do the below on a personal machine
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/neto/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew analytics off

echo 'Installing packages by Homebrew...'
packages=(
    alacritty
    # fzf
    # gh
    # git
    hammerspoon
    neovim
    # ripgrep
    # rust
    # slack
    stow
    tmux
    tree
    # zoom
    # zsh
    # zsh-autosuggestions
)

for package in ${packages[@]}; do
    brew install $package
done

# Install plugins and key-bindings
$(brew --prefix)/opt/fzf/install

# Install font
# brew tap homebrew/cask-fonts
# brew install --cask font-jetbrains-mono

echo 'Starting syncthing...'
brew services start syncthing

echo 'Grant permissions to setup.sh and uninstall.sh...'
sudo chmod +x setup.sh
sudo chmod +x uninstall.sh

echo 'Set up dotfiles...'
./setup.sh

