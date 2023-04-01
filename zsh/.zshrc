#!/usr/bin/zsh
# Personal Zsh Configuration
# Author: Francisco Cornejo-Garcia (@franciscornejog)

# Environment Variables --------------------------------------------------------
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:./node_modules/.bin
export JAVA_HOME='$HOME/Library/Java/JavaVirtualMachines/openjdk-17/Contents/Home'
export EDITOR='nvim'
eval "$($HOME/homebrew/bin/brew shellenv)"
export TDD_PROJECT_ROOT=/Users/neuan/1_projects/tdd-project
export GO111MODULE="on"
export GOPATH=""

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

alias jc='javac -d build/ src/provided/*.java src/treeNodes/*.java src/testers/*.java'
alias jt='java -cp build testers.JottTokenizerTester'
alias jp='java -cp build testers.JottParserTester'
alias jv='java -cp build testers.JottValidatorTester'

export FZF_DEFAULT_COMMAND="find -H $HOME/1_projects/ $HOME/2_areas  $HOME/3_resources $HOME/4_archive"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey -e # emac keybindings
bindkey '^j' fzf-cd-widget
export PATH="$HOME/homebrew/opt/arm-none-eabi-gcc@9/bin:$PATH"

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
