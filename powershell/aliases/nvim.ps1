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
    [string] $Color
  )

  Write-Host "`e]11;${Color}`a" -NoNewline
}

function nvim-with-dynamic-terminal-background-color {
  update-terminal-background-color -Color '#282c34'
  nvim.exe $args
  update-terminal-background-color -Color '#121212'
}

# neovim aliases
function v { nvim-with-dynamic-terminal-background-color $args }
function vi { nvim-with-dynamic-terminal-background-color $args }
function vim { nvim-with-dynamic-terminal-background-color $args }
function nvim { nvim-with-dynamic-terminal-background-color $args }

# in case the need to use vim
function \vim { vim.exe $args }

# open neovim normally without changing terminal background color
function \nvim { nvim.exe $args }
