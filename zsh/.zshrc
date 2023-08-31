#!/usr/bin/zsh
# Personal Zsh Configuration
# Author: Francisco Cornejo-Garcia (@franciscornejog)

# Environment Variables --------------------------------------------------------
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:./node_modules/.bin
export EDITOR='nvim'
export JAVA_HOME='$HOME/Library/Java/JavaVirtualMachines/openjdk-17/Contents/Home'

# Prompt -----------------------------------------------------------------------
autoload -Uz vcs_info                            # autoload vcs_info
precmd() { vcs_info }                            # show vcs_info as function
setopt prompt_subst                              # enable substitution in prompt
zstyle ':vcs_info:*' enable git                  # only enable git
zstyle ':vcs_info:*' check-for-changes true      # check for unstaged changes
zstyle ':vcs_info:*' unstagedstr '*'             # set symbol for unstaged
zstyle ':vcs_info:*' stagedstr '+'               # set symbol for staged
zstyle ':vcs_info:git:*' formats '%F{white} (%b%u%c%f)'       # set default format
zstyle ':vcs_info:git:*' actionformats '%F{white} (%b|%a%u%c%f)' # for git action

# export PROMPT='%B%1~%b$vcs_info_msg_0_%(!.#.%(?.:.%F{red}:)%f[$(show_org)]: '
export PROMPT='%B%1~%b$vcs_info_msg_0_%(!.#.%(?.:.%F{red}:)%f '

# Zsh Plugins ------------------------------------------------------------------
eval "$(zoxide init zsh)"
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
