# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ll="ls -l"
alias la="ls -a"
alias lal="ls -al"
alias lla="ls -al"

# SVN editor setting
export SVN_EDITOR="emacs"

# Load RVM script
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

