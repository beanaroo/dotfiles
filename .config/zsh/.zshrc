###--- ZSH Framework ---###

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

###--- Run ---###
# Workaround duplicate prompt on initial tmux session caused by SIGWINCH
if [[ $TERM == "tmux-256color" ]]; then sleep 0.1 && clear; fi;

# Rehash
zstyle ':completion:*' rehash true

###--- History ---###
# Ignore duplicate entries
setopt HIST_IGNORE_DUPS
# Do not record commands prepended with a <space>
setopt HIST_IGNORE_SPACE

###--- Input ---###
# 10ms for key sequences
KEYTIMEOUT=1

###--- Colour ---###
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-ocean.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

###--- Aliases ---###
alias virsh='virsh -c qemu:///system'
alias virt-viewer='virt-viewer -c qemu:///system'
alias ssh='TERM=xterm-256color ssh'

# Microsoft Office 2010 via WINE
#alias msonenote="env WINEPREFIX="/home/bean/.local/share/office2010" wine start /Unix /home/bean/.local/share/office2010/dosdevices/c:/users/bean/Start\ Menu/Programs/Microsoft\ Office/Microsoft\ OneNote\ 2010.lnk"
#alias msexcel="env WINEPREFIX="/home/bean/.local/share/office2010" wine start /Unix /home/bean/.local/share/office2010/dosdevices/c:/users/bean/Start\ Menu/Programs/Microsoft\ Office/Microsoft\ Excel\ 2010.lnk"
#alias msword="env WINEPREFIX="/home/bean/.local/share/office2010" wine start /Unix /home/bean/.local/share/office2010/dosdevices/c:/users/bean/Start\ Menu/Programs/Microsoft\ Office/Microsoft\ Word\ 2010.lnk"
#alias mspowerpnt="env WINEPREFIX="/home/bean/.local/share/office2010" wine start /Unix /home/bean/.local/share/office2010/dosdevices/c:/users/bean/Start\ Menu/Programs/Microsoft\ Office/Microsoft\ PowerPoint\ 2010.lnk"

# Tmux
alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'

# Initiate status line after base16_shell.
#[[ -n $TMUX ]] && tmux set-window-option status on

case $TERM in
	screen*|tmux*)
		precmd(){
			# Restore tmux-title to 'zsh'
			printf "\033kzsh\033\\"
			# Restore urxvt-title to 'zsh'
			print -Pn "\e]2;%~\a"
		}
		preexec(){
			# set tmux-title to running program
			printf "\033k$(echo "$1" | cut -d" " -f1)\033\\"
			# set urxvt-title to running program
			print -Pn "\e]2;$(echo "$1" | cut -d" " -f1)\a"
                }
        ;;
esac

# Source extras
source $ZDOTDIR/.zstomb
