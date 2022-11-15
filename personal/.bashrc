# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="/snap/bin:$HOME/.local/bin:$HOME/bin:$HOME/Software/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export LD_LIBRARY_PATH=/usr/local/lib64/:/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig
alias vim=nvim
alias pip=pip3
export SUDO_EDITOR=vim
export EDITOR=nvim
# export TERM="xterm-256color"
set -o vi
bind '"jk":vi-movement-mode'

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Get active git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

# export PS1="\[\e[1;32m\]\u\[\e[m\]:\[\e[1;34m\]\W\[\e[m\] \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
export PS1="\[\e[38;5;214m\]\u\[\e[m\]:\[\e[38;5;108m\]\W\[\e[m\] \[\e[38;5;167m\]\$(parse_git_branch)\[\e[00m\]\$ "
