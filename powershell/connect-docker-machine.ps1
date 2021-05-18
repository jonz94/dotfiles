if ($(docker-machine.exe status) -eq "Running") {
  docker-machine.exe env | Invoke-Expression
}
