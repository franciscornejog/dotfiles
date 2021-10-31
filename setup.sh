# Personal Dotfiles Configuration
# Author:  Francisco Cornejo-Garcia

# Home -------------------------------------------------------------------------
home=(
    git
    tmux
    vim
    zsh
)

# Config -----------------------------------------------------------------------
config=(
    alacritty
    nvim
    skhd
    yabai
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
