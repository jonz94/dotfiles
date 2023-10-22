# clear
Set-Alias -Name c -Value Clear-Host

# poweroff
function poweroff { shutdown /s /t 0 }

# shutdown WSL
function wslshutdown { wsl.exe --shutdown }
function wslpoweroff { wsl.exe --shutdown }

# echo path in pretty format
function echopath { (Write-Output $env:PATH).split(';') }

# echo powershell's escape character, because I've always thought it is backslash...
function echo-powershell-escape-character {
  Write-Host "Powershell's escape character is backquote ``"
}

# open recycle bin directory in file explorer
function trash { Start-Process shell:RecycleBinFolder }

# cd to dotfiles
function dot { Set-Location $HOME\dotfiles }

# make a directory with `-p` flag (no error if existing, make parent directories as needed)
function mkdirp {
  if ($args.length -lt 1) {
    return
  }

  New-Item -ItemType Directory -ErrorAction SilentlyContinue $args[0]
}

# make a directory with `-p` flag and then cd into it
function take {
  if ($args.length -lt 1) {
    return
  }

  New-Item -ItemType Directory -ErrorAction SilentlyContinue $args[0]
  Set-Location $args[0]
}

# kill process
function pkill { taskkill.exe /IM $args }

# make
function m { make.exe $args }

# whatis
function whatis { ((Get-Command $args[0]).Definition).Trim() }
