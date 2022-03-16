# Personal Zsh Configuration
# Author: Francisco Cornejo-Garcia (@franciscornejog)

# Environment Variables --------------------------------------------------------
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:./node_modules/.bin
export JAVA_HOME='/Users/fjcg/Library/Java/JavaVirtualMachines/openjdk-17/Contents/Home'
eval "$(homebrew/bin/brew shellenv)"

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

PROMPT='%B%1~%b$vcs_info_msg_0_%(!.#.%(?.:.%F{red}:)%f '

# Zsh Plugins ------------------------------------------------------------------
# source ~/.local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Aliases ----------------------------------------------------------------------
alias src="source"
alias vi='nvim'
alias l='exa -al'
alias lt='exa --tree'
alias ..='cd ..'
alias ...='cd ../..'

alias dv='cd ~/.config/nvim'

alias sf='vi $(fzf)'
alias sd='cd $(fd -t d . $HOME | fzf)'
alias sp='vi $(fd -H . ~/Documents/1_projects | fzf)'
alias sa='vi $(fd -H . ~/Documents/2_areas | fzf)'
alias sr='vi $(fd -H . ~/Documents/3_resources | fzf)'

alias ga='git add'
alias gc='git commit -m'
alias gd='git diff'
alias gl='git log'
alias gp='git push'
alias gs='git status'

alias luamake=/Users/fjcg/repositories/lua-language-server/3rd/luamake/luamake

# Set up fzf
# /usr/local/opt/fzf/install

export FZF_DEFAULT_COMMAND="fd -H . $HOME"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
