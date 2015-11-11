# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH

source $ZSH/oh-my-zsh.sh

alias branch="git branch -r"
alias master="git checkout master"
alias roscd="roscd && cd ../src"
alias catkin_make="roscd && cd ../ && catkin_make"
alias log_graph="git log --graph --pretty='format:%C(yellow)%h%Creset %s %Cgreen(%an)%Creset %Cred%d%Creset'"

function rosn() {
	if [ "$1" = "" ]; then
		topic=$(rosnode list | percol | xargs -n 1 rosnode info | percol | sed -e 's%.* \* \(/[/a-zA-Z0-9_]*\) .*%\1%')
	else
		topic=$(rosnode info $1 | percol | sed -e 's%.* \* \(/[/a-zA-Z0-9_]*\) .*%\1%')
	fi
	
	if [ "$topic" != "" ] ; then
		rost $topic
	fi
}

function rost() {
	if [ "$1" = "" ]; then
		node=$(rostopic list | percol | xargs -n 1 rostopic info | percol | sed -e 's%.* \* \(/[/a-zA-Z0-9_]*\) .*%\1%')
	else
		node=$(rostopic info $1 | percol | sed -e 's%.* \* \(/[/a-zA-Z0-9_]*\) .*%\1%')
	fi
	
	if [ "$node" != "" ] ; then
		rosn $node
	fi
}

function search-rostopic-by-percol(){
    LBUFFER=$LBUFFER$(rostopic list | percol)
    zle -R -c
}
zle -N search-rostopic-by-percol

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

bindkey '^[r' search-rostopic-by-percol

export TERM="screen-256color"

source /opt/ros/indigo/setup.zsh
source ~/catkin_ws/devel/setup.zsh
