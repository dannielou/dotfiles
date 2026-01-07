# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%d/%m/%y %T "
unset HISTFILESIZE
HISTSIZE=10000
PROMPT_COMMAND="history -a"
export HISTSIZE PROMPT_COMMAND
shopt -s histappend


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#xterm-color)
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    ;;
#*)
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#    ;;
#esac

PS1='\[\033[01;30m\][\[\033[01;31m\]\u\[\033[01;33m\]@\[\033[00m\]\h:\[\033[01;32m\]\w\[\033[00m\]\[\033[01;30m\]]\[\033[00m\]# '
PS2='more ? ' 
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# enable color support of ls and also add handy aliases
#if [ "$TERM" != "dumb" ]; then
#    alias ls='ls --color=auto'
#fi

if [ "$TERM" != "dumb" ]; then
    alias ls='ls -G'
fi

# some more ls aliases
 alias ls='ls $LS_OPTIONS -FG'
 alias ll='ls $LS_OPTIONS -l'
 alias l='ls $LS_OPTIONS -lA'
 alias lt='ls $LS_OPTIONS -lArt'
 alias lh='ls $LS_OPTIONS -lSArh'
 alias rm='rm -i'
 alias cp='cp -i'
 alias x='exit'
 alias w='w -n'
 alias grep='grep --color'
 alias lsof='echo "why not fstat?"'
 alias ethtool='echo "why not netstat -idb -I igc0?"'

export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export BLOCKSIZE=k
export EDITOR=vim
export PAGER=less
#umask 077
if [[ $- == *i* ]]; then
	bind 'set enable-bracketed-paste Off'
	zpool list
	pkg check --dependencies
fi
