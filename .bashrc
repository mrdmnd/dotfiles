#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lphk --group-directories-first --color=auto'
PS1='[\u@\h \W]\$ '

# Set flags for package making.
export PATH="/usr/lib/ccache/bin/:$PATH"
export MAKEFLAGS="-j13 -l12"
export CXX=`which clang++`
export CC=`which clang`

source .xinitrc
xmodmap ~/.xmodmap
