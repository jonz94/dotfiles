# restarts the Windows Explorer process (a.k.a. `explorer.exe`)
# useful when applications like `TranslucentTB` do not work properly
function restart-explorer-dot-exe {
  Stop-Process -Name "explorer" -Force
}
