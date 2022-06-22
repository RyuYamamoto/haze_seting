set -gx TERM xterm-256color

alias vim='nvim'
alias rosed='colcon edit'

#set -g theme_color_scheme terminal-dark

starship init fish | source

register-python-argcomplete --shell fish ros2 | source

#set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
#powerline-setup
