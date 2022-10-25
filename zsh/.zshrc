#!/usr/bin/zsh
# Personal Zsh Configuration
# Author: Francisco Cornejo-Garcia (@franciscornejog)

# Environment Variables --------------------------------------------------------
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:./node_modules/.bin
export JAVA_HOME='$HOME/Library/Java/JavaVirtualMachines/openjdk-17/Contents/Home'
export EDITOR='nvim'
show_org() { 
    sfdx config:get defaultusername --json | jq '.result[].value' -r
}
eval "$($HOME/homebrew/bin/brew shellenv)"

# Prompt -----------------------------------------------------------------------
eval "$(starship init zsh)"

# Zsh Plugins ------------------------------------------------------------------
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases ----------------------------------------------------------------------
alias vi='nvim'
alias l='exa -al'
alias lt='exa --tree'
alias ..='cd ..'
alias ...='cd ../..'

alias fv='cd ~/.config/nvim'
alias ff='vi $(find $HOME/1_projects $HOME/2_areas $HOME/3_resources $HOME/4_archive -print | fzf)'
alias fd='cd $(find $HOME/1_projects $HOME/2_areas $HOME/3_resources $HOME/4_archive -type d -d 1 -print | fzf)'

alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gp='git push'
alias gP='git pull'
alias gs='git switch'
alias gS='git status --short --branch'

export FZF_DEFAULT_COMMAND="find -H $HOME/1_projects/ $HOME/2_areas  $HOME/3_resources $HOME/4_archive"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey -e # emac keybindings
bindkey '^j' fzf-cd-widget
export PATH="$HOME/homebrew/opt/arm-none-eabi-gcc@9/bin:$PATH"
