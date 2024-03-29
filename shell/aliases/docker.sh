# docker command aliases

if type docker &> /dev/null; then
  alias d='docker'
  alias de='docker exec --interactive --tty'
  alias dei='docker exec --interactive'
  alias dex='docker exec'
  alias di='docker image'
  alias din='docker inspect'
  alias dlg='docker logs'
  alias dlgf='docker logs -f'
  alias dn='docker network'
  alias dp='docker pull'
  alias dpa='docker container ls'
  alias dr='docker run --interactive --tty --rm'
  alias dv='docker volume'

  dst () {
    echo
    echo '【Container 容器執行狀態列表】'
    docker container ls -a
    echo
    echo '【Volume 儲存空間列表】'
    docker volume ls
    echo
    echo '【Network 網路列表】'
    docker network ls
    echo
  }

  drm () {
    for i in $@; do
      docker stop $i
      docker rm $i
    done;
  }
fi

# docker compose
alias dc='docker compose'
alias dcd='docker compose down'
alias dcu='docker compose up'
