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
read -sp $'Go to Sound to change output and turn off sound effects\n'
read -sp $'Go back to Terminal\n'

# Defaults Settings ------------------------------------------------------------
echo 'Removing apps from the Dock...'
defaults write com.apple.dock persistent-apps -array
killall Dock

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
    exa
    git
    hammerspoon
    lua-language-server
    luajit
    luarocks
    neovim
    ripgrep
    slack
    sqlite
    stow
    syncthing
    tmux
    z
    zoom
    zsh
    zsh-autosuggestions
)

for package in ${packages[@]}; do
    brew install $package
done

# Install font
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

# Install luarocks packages
luarocks install luasql-sqlite3 SQLITE_DIR=/usr/local/Cellar/sqlite/3.37.0/

echo 'Installing Rust...'
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update

echo 'Starting syncthing...'
brew services start syncthing

read -sp $'Install Wally\n'

echo 'Set up dotfiles'
# dotfiles in setup.sh

