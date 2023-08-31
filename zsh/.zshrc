#!/usr/bin/zsh
# Personal Zsh Configuration
# Author: Francisco Cornejo-Garcia (@franciscornejog)

# Environment Variables --------------------------------------------------------
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:./node_modules/.bin
export PATH="$PATH:/Users/neuan/.dotnet/tools"
export EDITOR='nvim'
export GO111MODULE="on"
export GOPATH=""
export JAVA_HOME='$HOME/Library/Java/JavaVirtualMachines/openjdk-17/Contents/Home'
export TDD_PROJECT_ROOT=/Users/neuan/1_projects/tdd-project

# Apps -------------------------------------------------------------------------
# eval "$(zoxide init zsh)"

# Zsh Plugins ------------------------------------------------------------------
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases ----------------------------------------------------------------------
alias vi='nvim'
alias l='ls --color=auto -al'
alias ..='cd ..'
alias ...='cd ../..'
alias py='python3'
alias pip='pip3'

alias fv='cd ~/.config/nvim'
alias ff='vi $(find $HOME/1_projects $HOME/2_areas $HOME/3_resources $HOME/4_archive -print | fzf)'
alias fp='vi $(find . | fzf)'
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

bindkey -e # emac keybindings
bindkey ^j fzf-cd-widget
foreground() { fg }
zle -N foreground
bindkey ^z foreground

# Commands ---------------------------------------------------------------------
# create lwc
slc() {
    sfdx force:lightning:component:create --componentname=$1 --type lwc --outputdir=force-app/main/default/lwc
}
# create apex class
sac() {
    sfdx force:apex:class:create -n $1 --outputdir=force-app/main/default/classes
}
# create apex trigger
stc() {
    sfdx force:apex:trigger:create -n $1 --outputdir=force-app/main/default/triggers
}
# get org
alias scg="sfdx config:get defaultusername --json | jq '.result[].value' -r"
# set org
scs() {
    sfdx config:set defaultusername=$1
}
# list aliases
alias sal='sfdx alias:list'
