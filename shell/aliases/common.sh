# common command aliases for Linux, macOS

alias c='clear'
alias echopath='echo $PATH | tr ":" "\n"'
alias edit-last-command-in-editor='fc'
alias h='history | less'
alias l='ls -lhF'
alias la='ls -AlhF'
alias ll='ls -alhF'
alias m='make'
alias now='date +"%Y-%m-%d %H:%M:%S"'
alias p8='ping 8.8.8.8'
alias p='ping'
alias psssh='ps aux | grep ssh'
alias t.='tree .'

# file manager
if [ $(uname) = "Darwin" ]; then
  alias e.='open .'
  alias o.='open .'
else
  alias e.='xdg-open .'
  alias o.='xdg-open .'
fi

# mkdir -p directory & touch file
touchp () {
  mkdir -p $(dirname "$1") && touch "$1"
}
