# docker aliases
function d { docker.exe $args }

function de { docker.exe exec --interactive --tty $args }

function dei { docker.exe exec --interactive $args }

function dex { docker.exe exec $args }

function di { docker.exe image $args }

function din { docker.exe inspect $args }

function dlg { docker.exe logs $args }

function dn { docker.exe network $args }

function dp { docker.exe pull $args }

function dpa { docker.exe ps -a }

function drm {
  foreach ($arg in $args) {
    docker.exe stop $arg
    docker.exe rm $arg
  }
}

function dst {
  Write-Host "`n[Container list]"
  docker.exe container ls -a
  Write-Host "`n[Volume list]"
  docker.exe volume ls
  Write-Host "`n[Network list]"
  docker.exe network ls
  Write-Host ""
}

function dv { docker.exe volume $args }

# docker compose aliases
function dc { docker-compose.exe $args }

