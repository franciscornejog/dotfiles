# Personal Installation Configuration
# Author: Francisco Cornejo-Garcia

# System Preferences -----------------------------------------------------------
read -sp $'Go to System Preferences\n'
read -sp $'Go to Desktop & Screen Saver to set black background\n'
read -sp $'Go to Dock to hide them\n'
read -sp $'Go to Users & Groups to change profile picture\n'
read -sp $'Go to Notifications to configure them \n'
read -sp $'Go to Sound to change output and turn off sound effects\n'
read -sp $'Go back to Terminal\n'

# Defaults Settings ------------------------------------------------------------
echo 'Removing apps from the Dock...'
# defaults write com.apple.dock persistent-apps -array
# killall Dock

# Software Installation --------------------------------------------------------
echo 'Installing Xcode Command Line Tools...'
# xcode-select --install

echo 'Installing Homebrew...'
if test ! $(which brew); then
    mkdir -p $HOME/homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/homebrew
    eval "$($HOME/homebrew/bin/brew shellenv)"
fi

brew update
chmod -R go-w "$(brew --prefix)/share/zsh"

echo 'Installing packages by Homebrew...'
packages=(
    alacritty
    brave-browser
    discord
    exa
    fzf
    git
    hammerspoon
    lua-language-server
    luajit
    luarocks
    neovim
    ripgrep
    rust
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

# Install plugins and key-bindings
/Users/ocla/homebrew/opt/fzf/install

# Install font
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

# Install luarocks packages
# luarocks install luasql-sqlite3 SQLITE_DIR=/usr/local/Cellar/sqlite/3.37.0/

echo 'Starting syncthing...'
brew services start syncthing

echo 'Set up dotfiles'
# dotfiles in setup.sh

