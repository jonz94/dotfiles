# Aliases for docker related

alias docker='docker.exe'
alias docker-compose='docker-compose.exe'
alias docker-machine='docker-machine.exe'

alias d='docker.exe'
alias de='docker.exe exec --interactive --tty'
alias dei='docker.exe exec --interactive'
alias dex='docker.exe exec'
alias di='docker.exe image'
alias din='docker.exe inspect'
alias dlg='docker.exe logs'
alias dn='docker.exe network'
alias dp='docker.exe pull'
alias dpa='docker.exe ps -a'
alias dv='docker.exe volume'

drm () {
  for i in $@; do
    docker.exe stop $i;
    docker.exe rm $i;
  done;
}

alias dc='docker-compose.exe'
alias dcd='docker-compose.exe down'
alias dcu='docker-compose.exe up'

alias dm='docker-machine.exe'

alias dcon='. ${DOTS}/wsl/connect_docker_machine.sh'
