# Personal Dotfiles Configuration
# Author:  Francisco Cornejo-Garcia

# Create config directory
mkdir -p $HOME/.config

# Home -------------------------------------------------------------------------
home=(
    hammerspoon
    tmux
    vim
    zsh
)

# Config -----------------------------------------------------------------------
config=(
    alacritty
    git
    neovim
)

# Stow -------------------------------------------------------------------------
stowin() {
    target=$1
    source=$2
    # -verbose -Recursive -target
    stow -v -R -t ${target} ${source}
}

for app in ${home[@]}; do
    stowin "${HOME}" $app
done

for app in ${config[@]}; do
    stowin "${HOME}/.config/" $app
done
