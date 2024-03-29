#!/bin/sh
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000
#HISTTIMEFORMAT="%H%M %d/%m "
HISTTIMEFORMAT="[%d-%m-%y %T] "
HISTIGNORE="pwd:ls:ls -ltr:ls -l:ls -la:"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

. ~/.dot_files/bash_prompt_basic_git_status.sh
. ~/.dot_files/bash_aliases.sh
. ~/.dot_files/bash_functions.sh

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# include completion
for compl in ${HOME}/.dot_files/bash_completion.d/*; do . "$compl"; done

# include additional files
for include in ${HOME}/.dot_files/include.d/*; do . "$include"; done

# VirtualEnv(Wrapper) conf
if [ -e /opt/python/2.7/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/opt/python/2.7/bin/python
    export PYTHON=/opt/python/2.7/bin/python
    . /opt/python/2.7/bin/virtualenvwrapper.sh
    alias mkvenvloc='mkvirtualenv --python=/opt/python/2.7/bin/python'
fi

export GOPATH=~/projects/go
export PATH=$PATH:~/.bin:$GOPATH/bin:~/.local/bin

if [ -e /opt/python/2.7/bin/virtualenvwrapper.sh ]; then
	source ~/.autoenv/activate.sh
fi

complete -C ${HOME}/projects/go/bin/gocomplete go

export EDITOR=nano
complete -F __start_kubectl k

export LESS_TERMCAP_mb="$(printf "\e[1;31m")"
export LESS_TERMCAP_md="$(printf "\e[1;31m")"
export LESS_TERMCAP_me="$(printf "\e[0m")"
export LESS_TERMCAP_se="$(printf "\e[0m")"
export LESS_TERMCAP_so="$(printf "\e[1;44;33m")"
export LESS_TERMCAP_ue="$(printf "\e[0m")"
export LESS_TERMCAP_us="$(printf "\e[1;32m")"

export EDITOR=nano

# source local config if exists
if [ -e ${HOME}/.dot_files/local.sh ]; then
    . ${HOME}/.dot_files/local.sh
fi
