# Personal Zsh Configuration
# Author: Francisco Cornejo-Garcia (@franciscornejog)

# Environment Variables --------------------------------------------------------
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:./node_modules/.bin
export JAVA_HOME='/Users/fjcg/Library/Java/JavaVirtualMachines/openjdk-17/Contents/Home'
export EDITOR='nvim'
show_org() { 
    sfdx config:get defaultusername --json | jq '.result[].value' -r
}
eval "$($HOME/homebrew/bin/brew shellenv)"

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
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases ----------------------------------------------------------------------
alias vi='nvim'
alias l='exa -al'
alias lt='exa --tree'
alias ..='cd ..'
alias ...='cd ../..'

alias fv='cd ~/.config/nvim'
alias ff='vi $(fzf)'
alias fd='cd $(fzf)'

alias ga='git add'
alias gc='git commit -m'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gp='git push'
alias gP='git pull'
alias gs='git status --short --branch'

export FZF_DEFAULT_COMMAND="find -H . $HOME/Documents/"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $HOME/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey -e
# eval 
# SFDX_AC_ZSH_SETUP_PATH=/Users/franciscocornejogarcia/Library/Caches/sfdx/autocomplete/zsh_setup && test -f $SFDX_AC_ZSH_SETUP_PATH && source $SFDX_AC_ZSH_SETUP_PATH; # sfdx autocomplete setup
export PATH="/Users/neuan/homebrew/opt/arm-none-eabi-gcc@9/bin:$PATH"
