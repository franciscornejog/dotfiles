# list of apps
apps=(
    git
    vim
    tmux
    emacs
)

stowin() {
    target=$1
    app=$2
    # -verbose -Recursive -target
    stow -v -R -t ${target} ${app}
}

for app in ${apps[@]}; do
    stowin "${HOME}" $app
done
