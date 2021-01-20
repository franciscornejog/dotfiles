#!/usr/bin/env zsh

# list of apps
apps=(
    git
    vim
    tmux
)

stowin() {
    target=$1
    app=$2
    # -verbose -Recursive -target
    stow -v -R -t ${target} ${app}
}

echo "\nStowing:"
for app in ${apps[@]}; do
    stowin "${HOME}" $app
done

echo "\nDone"
    
