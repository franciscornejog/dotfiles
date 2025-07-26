# Personal Dotfiles Configuration
# Author:  Francisco Cornejo-Garcia

# Create config directory
mkdir -p $HOME/.config

# Home -------------------------------------------------------------------------
home=(
    # hammerspoon
    tmux
    # zsh
)

# Config -----------------------------------------------------------------------
config=(
    alacritty
    # gh
    # git
    # neovim
)

# Stow -------------------------------------------------------------------------
stow_in() {
    target=$1
    source=$2
    stow --verbose --restow --target ${target} ${source}
}

for app in ${home[@]}; do
    stow_in "${HOME}" $app
done

for app in ${config[@]}; do
    stow_in "${HOME}/.config/" $app
done
