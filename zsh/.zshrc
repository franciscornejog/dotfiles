# Personal Zsh Configuration
# Author: Francisco Cornejo-Garcia (@franciscornejog)

# Environment Variables --------------------------------------------------------
export JAVA_HOME='/Users/fjcg/Library/Java/JavaVirtualMachines/openjdk-17/Contents/Home'

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

PROMPT='%B%1~%b$vcs_info_msg_0_%(!.#.%(?.:.%F{red}:)%f '

# Zsh Plugins ------------------------------------------------------------------
# source ~/.local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Aliases ----------------------------------------------------------------------
alias src="source"
alias vi='nvim'
alias l='ls -al'

alias dv='cd ~/.config/nvim'

alias ct='vi ~/.local/share/nvim/site/pack/packer/start/noired.nvim/lua/noired.lua'
alias ca='vi ~/.config/alacritty/alacritty.yml'
alias cg='vi ~/.config/git/config'
alias cz='vi ~/.zshrc'

alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'

alias luamake=/Users/fjcg/repositories/lua-language-server/3rd/luamake/luamake

# Set up fzf
# /usr/local/opt/fzf/install

export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
# fix FZF ALT C COMMAND
bindkey "ç" fzf-cd-widget
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
