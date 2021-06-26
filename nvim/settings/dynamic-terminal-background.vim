" dynamic change terminal's background color when entering and exiting vim

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

" for alacritty with custom dynamic config file setup
if $DYNAMIC_ALACRITTY_CONFIG_FILE != '' && filereadable($DYNAMIC_ALACRITTY_CONFIG_FILE)
  autocmd VimEnter * silent :!sed -i 's/121212/282c34/g' $DYNAMIC_ALACRITTY_CONFIG_FILE
  autocmd VimLeave * silent :!sed -i 's/282c34/121212/g' $DYNAMIC_ALACRITTY_CONFIG_FILE
  finish
endif

" for mac using iTerm2
if has('mac')
  autocmd VimEnter * silent :Dispatch! python3 ~/dotfiles/scripts/iterm2/change-background-to-match-neovim.py
  autocmd VimLeave * silent :!python3 ~/dotfiles/scripts/iterm2/change-background-to-match-default.py
  finish
endif

" for WSL using Windows Terminal
if has('wsl')
  let s:settings = expand('/mnt/c/Users/' . $USER . '/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json')
  if filereadable(s:settings)
    autocmd VimEnter * :call system('sed -i "s/121212/282c34/g" ' . s:settings)
    autocmd VimLeave * :call system('sed -i "s/282c34/121212/g" ' . s:settings)
  endif
endif

" for windows using Windows Terminal
if has('win32') && executable('sed')
  let s:settings = expand('~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json')
  if filereadable(s:settings)
    autocmd VimEnter * :call system('sed -i "s/121212/282c34/g" ' . s:settings)
    autocmd VimLeave * :call system('sed -i "s/282c34/121212/g" ' . s:settings)
  endif
endif
