#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\n\[$(tput sgr0)\]\[\033[38;5;12m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\[$(tput sgr0)\]\[\033[38;5;5m\]\h\[$(tput sgr0)\]\[\033[38;5;7m\]:\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;7m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
