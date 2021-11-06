# Personal Zsh Configuration
# Author: Francisco Cornejo-Garcia (@franciscornejog)

# Prompt -----------------------------------------------------------------------
autoload -Uz vcs_info                            # autoload vcs_info
precmd() { vcs_info }                            # show vcs_info as function
setopt prompt_subst                              # enable substitution in prompt
zstyle ':vcs_info:*' enable git                  # only enable git
zstyle ':vcs_info:*' check-for-changes true      # check for unstaged changes
zstyle ':vcs_info:*' unstagedstr '*'             # set symbol for unstaged
zstyle ':vcs_info:*' stagedstr '+'               # set symbol for staged
zstyle ':vcs_info:git:*' formats '%F{white}.%b%u%c%f'       # set default format
zstyle ':vcs_info:git:*' actionformats '%F{white}.%b|%a%u%c%f' # for git action

PROMPT='%B%F{240}%1~%f%b$vcs_info_msg_0_%(!.#.%(?.:.%F{red}:)%f '

# Aliases ----------------------------------------------------------------------
alias src="source"
alias vi='nvim'
alias l='ls -al'

alias gv='cd ~/.config/nvim'
alias ca='vi ~/.config/alacritty/alacritty.yml'
alias cg='vi ~/.config/git/config'
alias cz='vi ~/.zshrc'

alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
