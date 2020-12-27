# .zshrc updated by Kuen 12/30/2013 - 12/26/2020

# Setup new style completion system
autoload -U compinit && compinit
# Colors for ZSHELL prompt
autoload -U colors && colors

#---------------------------------------
# Paths
#export PATH=$PATH:$HOME/shellenv/scripts
export PATH=:$HOME/shellenv/scripts:$PATH

# *nix Specific Paths
case "$OSTYPE" in
  darwin*)  # OSX
    # Macports paths
    export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/mysql/bin:$PATH
    ;;
  linux*)

    ;;
esac

#---------------------------------------
# Set / unset shell options
# Prevent listing all possibilities with * and tab
setopt GLOB_COMPLETE
# Superglobs
unsetopt CASE_GLOB
setopt extendedglob
setopt nocaseglob
setopt rcexpandparam
setopt nocheckjobs
setopt numericglobsort
setopt appendhistory
setopt histignorealldups    # Trim all history duplicates
#setopt EXTENDEDGLOB
unsetopt BEEP               # Disable tab completion beep
#setopt HIST_IGNORE_DUPS     # Ignore history duplicate lines

#---------------------------------------
# Check for Python3 compatibility
if [ $(command -v python3) ] ; then alias python='python3' ; fi
if [[ $(python -V 2>&1) =~ [[:space:]][3.] ]] ; then PYTH3=1 ; fi

#---------------------------------------
# LS Colors in terminal
export CLICOLOR=1
unset LSCOLORS
export LSCOLORS=gxfxcxdxbxegedabagacad
unset LS_COLORS
export LS_COLORS=$LS_COLORS:'di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=36:'

#---------------------------------------
# Completion styles
# Verbose on for detailed menu items (no truncation)
zstyle ':completion:*' verbose true
# Sorts and categorizes tab completion line items
zstyle ':completion:*:descriptions' \
  format $'%{- \e[38;5;137;1m\e[48;5;234m%}%B%d%b%{\e[m%}'
# Tab completion with selectable menu (>1 match)
#zstyle ':completion:*' menu select=1
# Tab completion with selectable menu on ambiguous completion
zstyle ':completion:*' menu yes select
# Allows for globbing with partial words or characters
zstyle ':completion:*' completer _complete _correct _approximate
# Correctly prioritize expansion categories
zstyle ':completion:*' group-name ''
# Case insensitive matching with tab
# in order try:
#   simple tab completion
#   case insensitive completion (partial completion .,_,- & l/r completion)
#   simple substring completion
#   case insensitive substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' 'l:|=* r:|=*' \
  'm:{a-zA-Z}={A-Za-z} r:|[._-]=* r:|=*' \
  'm:{a-zA-Z}={A-Za-z} l:|=* r:|=*'

# No match warning message
zstyle ':completion:*:warnings' \
  format $'%{No match for \e[38;5;240;1m%}%d%{\e[m%}'
# Disable tab spacing on empty prompt--brings up tab completion instead
zstyle ':completion:*' insert-tab false

# Color differentiation for different file extensions (Python3)
if [ $PYTH3 ] ; then
#  unset ZLS_COLORS
#  export ZLS_COLORS=$(python .zls_color.py)
#  zstyle ':completion:*' list-colors ${(s.:.)ZLS_COLORS}
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

#---------------------------------------
# ZSH file type override
#zstyle ':completion:*:*:mpv:*' tag-order files
# VIM types that should probably not be edited.
zstyle ':completion:*:*:(vi|vim):*:*' \
  file-patterns '*~(*.o|*~|*.old|*.bak|*.pro|*.zwc|*.swp):regular-files' \
                '(*~|*.bak|*.old):backup-files' \
                '(*.o|*.pro|*.zwc|*.swp):hidden-files'

#---------------------------------------
# Key Bindings
#bindkey '\e^?' backward-kill-line
bindkey '\e^?' kill-whole-line
bindkey '^[[Z' reverse-menu-complete

#---------------------------------------
# Aliases - general
alias cd..='cd ..'
alias cd...='cd ../..'
alias df='df -h'
alias grep='grep -in --color=auto'
alias reload='source ~/.zshrc'
alias sudo='sudo '

# Program specific aliases
if [ $(command -v vim) ] ; then alias vi='vim' ; fi
alias m='mpv'     # MPlayer aliases
alias msl='mpv --geometry=0:100% --vf=scale=480:-2 --ontop'

#---------------------------------------
# Perform OS specific setup
case "$OSTYPE" in
  darwin*)  # OSX
    cName=$(scutil --get ComputerName)
    # Aliasses --
    alias ls='ls -lohF'
    alias ip='ifconfig | grep ask'
    ;;
  *bsd*)
    cName=$HOST
    ;;
  linux*)
    cName=$HOST
    # Aliasses --
    alias ls='ls -lohF --color=auto'
    ;;
esac

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
