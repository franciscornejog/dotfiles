# Personal Zsh Configuration
# Author: Francisco Cornejo-Garcia (@franciscornejog)

# Environment Variables --------------------------------------------------------
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:./node_modules/.bin
export JAVA_HOME='/Users/fjcg/Library/Java/JavaVirtualMachines/openjdk-17/Contents/Home'
export EDITOR='nvim'
eval "$(homebrew/bin/brew shellenv)"
show_org() { 
    sfdx config:get defaultusername --json | jq '.result[].value' -r
}

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

export PROMPT='%B%1~%b$vcs_info_msg_0_%(!.#.%(?.:.%F{red}:)%f[$(show_org)]: '

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

alias luamake=/Users/fjcg/repositories/lua-language-server/3rd/luamake/luamake

export FZF_DEFAULT_COMMAND="fd -H . $HOME/Documents/"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval 
SFDX_AC_ZSH_SETUP_PATH=/Users/franciscocornejogarcia/Library/Caches/sfdx/autocomplete/zsh_setup && test -f $SFDX_AC_ZSH_SETUP_PATH && source $SFDX_AC_ZSH_SETUP_PATH; # sfdx autocomplete setup
