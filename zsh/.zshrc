# Personal Zsh Configuration
# Author: Francisco Cornejo-Garcia (@franciscornejog)

# Environment Variables --------------------------------------------------------
export EDITOR=nvim
export NVIM_CONFIG=$HOME/.config/nvim

# Prompt -----------------------------------------------------------------------
autoload -Uz vcs_info                            # autoload vcs_info
precmd() { vcs_info }                            # show vcs_info as function
setopt prompt_subst                              # enable substitution in prompt
zstyle ':vcs_info:*' enable git                  # enable git
zstyle ':vcs_info:*' unstagedstr '*'             # set symbol for unstaged
zstyle ':vcs_info:*' stagedstr '+'               # set symbol for staged
zstyle ':vcs_info:git:*' formats ' %F{white}(%b%u%c)%f'       # set format
zstyle ':vcs_info:git:*' actionformats ' %F{white}(%b|%a%u%c)%f' # for git action

export PROMPT='%F{202}%B%1~%b%f$vcs_info_msg_0_%(!.#.%(?.:.%F{red}:)%f '

# Aliases ----------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias l='ls -AG1'
alias ll='ls -AGl | awk '\''{for (i=9; i<=NF; i++) printf "%s%s", $i, (i<NF?" ":"\n")}'\'''
alias lr='ls -RGl | awk '\''{for (i=9; i<=NF; i++) printf "%s%s", $i, (i<NF?" ":"\n")}'\'''
alias vi='nvim'
alias cdn='cd $NVIM_CONFIG'
alias ff='vi $(find $HOME/1_projects $HOME/2_areas $HOME/3_resources $HOME/4_archive -print | fzf)'
alias fp='vi $(find . | fzf)'
alias fd='cd $(find $HOME/1_projects $HOME/2_areas $HOME/3_resources $HOME/4_archive -type d -d 1 -print | fzf)'

# Git Aliases ------------------------------------------------------------------
alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gp='git push'
alias gP='git pull'
alias gs='git status --short --branch'
alias gS='git status'

# Completion -------------------------------------------------------------------
fpath=(~/.local/share/zsh/completions /opt/homebrew/share/zsh/site-functions $fpath)
autoload -Uz compinit; compinit

# Keybinds ---------------------------------------------------------------------
bindkey -v # vi keybindings

# export FZF_DEFAULT_COMMAND="find -H $HOME/1_projects/ $HOME/2_areas  $HOME/3_resources $HOME/4_archive"
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# bindkey ^j fzf-cd-widget
# foreground() { fg }
# zle -N foreground
# bindkey ^z foreground

