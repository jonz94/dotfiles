" import separate preset configurations inside presets diretory
for s:file in split(globpath('~/dotfiles/nvim/presets', '*.vim'), '\n')
  exe 'source' s:file
endfor

" setup path where vim-plug install plugins
if has('nvim-0.5')
  " seperate install location for normal neovim and nightly neovim
  " because most of bleeding edge plugins only support neovim nightly
  let s:plugins_install_path = stdpath('data') . '/plugged-nightly'
elseif has('nvim')
  let s:plugins_install_path = stdpath('data') . '/plugged'
elseif has('unix')
  " on Linux and macOS, make vim-plug install plugins at ~/.vim for vim
  let s:plugins_install_path = '~/.vim/plugged'
else
  " on Windows, make vim-plug install plugins at ~/vimfiles for vim
  let s:plugins_install_path = '~/vimfiles/plugged'
endif

" vim-plug
silent! call plug#begin(s:plugins_install_path)

if !exists('g:vscode')
  " run command inside vim asynchronously
  silent! Plug 'tpope/vim-dispatch'
endif

" import separate plugin configurations inside plugins diretory
for s:file in split(globpath('~/dotfiles/nvim/plugins', '*.vim'), '\n')
  exe 'source' s:file
endfor

if !exists('g:vscode')
  silent! Plug 'editorconfig/editorconfig-vim'
  silent! Plug 'farmergreg/vim-lastplace'
  silent! Plug 'mattn/emmet-vim'
  silent! Plug 'matze/vim-move'
  silent! Plug 'mzlogin/vim-markdown-toc'
  silent! Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  silent! Plug 'wsdjeg/vim-fetch'
  silent! Plug 'Xvezda/vim-nobin'
endif

silent! Plug 'tpope/vim-repeat'
silent! Plug 'tpope/vim-surround'

if has('nvim-0.5')
  silent! Plug 'famiu/nvim-reload'
endif

silent! call plug#end()

" import separate configurations inside plugins diretory
for s:file in split(globpath('~/dotfiles/nvim/settings', '*.vim'), '\n')
  exe 'source' s:file
endfor

if has('nvim-0.5')
  luafile ~/dotfiles/nvim/settings/lsp.lua
  luafile ~/dotfiles/nvim/settings/galaxyline.lua
  luafile ~/dotfiles/nvim/settings/tree-sitter.lua
  lua require('neoscroll').setup()
endif

" neovide specific setting
if exists('g:neovide')
  source $HOME/dotfiles/nvim/jonz94.gvim
endif

" use pwsh or powershell as default shell on windows environment
"if has('win32')
"  if executable('pwsh')
"    let &shell = 'pwsh'
"  else
"    let &shell = 'powershell'
"  endif
"  set shellquote=
"  set shellpipe=\|
"  set shellxquote=
"  set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
"  set shellredir=\|\ Out-File\ -Encoding\ UTF8
"endif
