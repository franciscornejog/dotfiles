# Personal Zsh Configuration
# Author: Francisco Cornejo-Garcia (@franciscornejog)

# Prompt -----------------------------------------------------------------------
autoload -Uz vcs_info                             # autoload vcs_info
precmd() { vcs_info }                            # show vcs_info as function
setopt prompt_subst                               # enable substitution in prompt
zstyle ':vcs_info:*' check-for-changes true       # check for unstaged changes
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '%F{white}.%b%u%c%f' # set format for git
zstyle ':vcs_info:*' enable git                   # only enable git

PROMPT='%B%F{240}%1~%f%b$vcs_info_msg_0_%(!.#.%(?.:.%F{red}:)%f '

# Aliases ----------------------------------------------------------------------
alias src="source"
alias vi='nvim'
alias l='ls -al'

alias ca='vi ~/.config/alacritty/alacritty.yml'
alias cz='vi ~/.zshrc'
