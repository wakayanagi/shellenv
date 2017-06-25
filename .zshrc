# .zshrc created by Kuen 12/30/2013 - 06/25/2017

# Setup new style completion system
autoload -U compinit && compinit
# Colors for ZSHELL prompt
autoload -U colors && colors

#---------------------------------------
# Paths
# Macports additional paths
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/mysql/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

#---------------------------------------
# Set / unset shell options
# Prevent listing all possibilities with * and tab
setopt GLOB_COMPLETE
# Superglobs
unsetopt CASE_GLOB
setopt EXTENDEDGLOB
# Disable beep sound during tab completion
unsetopt BEEP
# Ignore duplicate lines in history
setopt HIST_IGNORE_DUPS

#---------------------------------------
# Completion styles
# Verbose on for detailed menu items (no truncation)
zstyle ':completion:*' verbose true
# Sorts and categorizes tab completion line items
zstyle ':completion:*:descriptions' \
  format $'%{- \e[38;5;137;1m\e[48;5;234m%}%B%d%b%{\e[m%}'
# Tab completion with selectable menu (>1 match)
zstyle ':completion:*' menu select=1
# Allows for globbing with partial words or characters
zstyle ':completion:*' completer _expand _complete _correct _approximate
# Correctly prioritize expansion categories
zstyle ':completion:*' group-name ''
# Case insensitive matching with tab
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# No match warning message
zstyle ':completion:*:warnings' \
  format $'%{No match for \e[38;5;240;1m%}%d%{\e[m%}'
# Disable tab spacing on empty prompt--brings up tab completion instead
zstyle ':completion:*' insert-tab false

# Color differentiation for different file extensions
source ~/.zsh_colors
zstyle ':completion:*' list-colors ${(s.:.)ZLS_COLORS}

#---------------------------------------
# ZSH file type override for mplayer
zstyle ':completion:*:*:mplayer:*' tag-order files

# types that should probably not be edited.
zstyle ':completion:*:*:(vi|vim):*:*' \
  file-patterns '*~(*.o|*~|*.old|*.bak|*.pro|*.zwc|*.swp):regular-files' \
                '(*~|*.bak|*.old):backup-files' \
                '(*.o|*.pro|*.zwc|*.swp):hidden-files'

#---------------------------------------
# Key Bindings
bindkey '\e^?' backward-kill-line
bindkey '^[[Z' reverse-menu-complete

#---------------------------------------
# Aliases
alias cd..='cd ..'
alias cd...='cd ../..'
alias ls='ls -lohF'
alias df='df -h'
alias reload='source ~/.zshrc'
alias ip='ifconfig | grep ask'
alias sudo='sudo '

alias python='python3 '

# Aliases - Grep with color, case insensitive, and line number
alias grep='grep -in --color=auto'

# MPV Player Aliases
alias m='mpv'
alias msl='mpv --geometry=0:0 --vf=scale=480:-2,expand=-10:-10 --ontop'
alias mbw='mpv --geometry=0:0 --autofit=480 --ontop --saturation=-100'
alias m2='mpv --screen=1 --fs --ontop'
alias m2p='mpv --screen=1 --fs --fs-black-out-screens'
alias m3='mpv --screen=2 --fs --ontop'
alias m169='mpv --vf=scale=1280:-2,crop=1280:720'

#---------------------------------------
# Grab Computer Name
cName=$NAME  #For non-OSX computers
if [[ "$NAME" = "" ]] ; then
  # Attempt at OSX scutil if $NAME attribute has nothing
  cName=$(scutil --get ComputerName)
fi

#---------------------------------------
# Prompt Setup
PROMPT="%{$fg_no_bold[cyan]%}${cName}%{$fg_bold[red]%}:%1d ~$ %{$reset_color%}%"

#---------------------------------------
# Welcome Message
clear
if [[ $SHLVL -eq 1 ]] ; then
  print -P "${reset_color}Welcome to: $fg_bold[red]%m" \
      "${reset_color}@ %D{%T} on %D{%Y-%m-%d} running $(uname -srm) %1"
  echo
fi

