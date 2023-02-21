# update terminal background color by using special ansi escape sequences
#
# example usage 1:
#     update-terminal-background-color -Color "#282c34"
#
# example usage 2:
#     update-terminal-background-color -Color "#121212"
#
# credit: https://github.com/alacritty/alacritty/issues/656
function update-terminal-background-color {
  param(
    [string] $Color = '#121212'
  )

  Write-Host "`e]11;${Color}`a" -NoNewline
}

function invoke-nvim-with-dynamic-terminal-background-color {
  if ($args.Contains('-h') -or $args.Contains('--help') -or $args.Contains('-v') -or $args.Contains('--version')) {
    nvim.exe @args

    return
  }

  update-terminal-background-color -Color '#282c34'
  nvim.exe @args
  update-terminal-background-color -Color '#121212'
}

# neovim aliases
function v { invoke-nvim-with-dynamic-terminal-background-color @args }
function vi { invoke-nvim-with-dynamic-terminal-background-color @args }
function vim { invoke-nvim-with-dynamic-terminal-background-color @args }
function nvim { invoke-nvim-with-dynamic-terminal-background-color @args }

# in case the need to use vim
function \vim { vim.exe @args }

# open neovim normally without changing terminal background color
function \nvim { nvim.exe @args }

# edit PSReadLine history file via neovim
function vh {
  nvim.exe -c 'normal! G' (Get-PSReadLineOption).HistorySavePath
}
