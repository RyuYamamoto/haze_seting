#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

source ~/.zplug/init.zsh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

alias vi='nvim'
export PYTHONPATH=${PYTHONPATH}:~/Downloads/pynaoqi-python2.7-2.5.5.5-linux64/lib/python2.7/site-packages
export DYLD_LIBRARY_PATH=${DYLD_LIBRARY}:~/Downloads/pynaoqi-python2.7-2.5.5.5-linux64/lib

alias log_graph="git log --graph --pretty='format:%C(yellow)%h%Creset %s %Cgreen(%an)%Creset %Cred%d%Creset'"

# peco setting
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

#zle -N peco-history-selection
#bindkey '^R' peco-history-selection

if [[ ! -n $TMUX ]]; then
  tmux new-session
fi

if [[ ! -n $TMUX ]]; then
  tmux new-session && exit
fi
export PATH=$PATH:/usr/lib/go-1.9/bin

function percol_select_history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
    CURSOR=$#BUFFER             # move cursor
    zle -R -c                   # refresh
}
zle -N percol_select_history
bindkey '^R' percol_select_history

# ROS
source /opt/ros/kinetic/setup.zsh
source ~/catkin_ws/devel/setup.zsh

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

alias roste="rostopic list | percol | xargs rostopic echo"

# zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
zplug "b4b4r07/enhancd", use:enhancd.sh

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load
