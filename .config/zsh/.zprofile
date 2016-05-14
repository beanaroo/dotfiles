# Env-guard. Useful when using multiplexers.
if [[ $ENV_SET != yes ]]
then
    export PATH="$(ruby -e 'print Gem.user_dir')/bin:$HOME/.local/bin:$PATH"
    export EDITOR="nvim"
    export VISUAL="nvim"
    export BROWSER="firefox"
    export TERMCMD="termite"
    export WEECHAT_HOME="$HOME/.config/weechat"
    export ENV_SET="yes"
fi

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the default Less options.

# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-g -i -M -R -S -w -X -z-4'
# Disable history file
export LESSHISTFILE="-"
# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
