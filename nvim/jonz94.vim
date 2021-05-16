" import separate preset configurations inside presets diretory
for s:file in split(globpath('~/dotfiles/nvim/presets', '*.vim'), '\n')
  exe 'source' s:file
endfor

" vim-plug
silent! call plug#begin('~/.local/share/nvim/plugged')

" run command inside vim asynchronously
silent! Plug 'tpope/vim-dispatch'

" import separate plugin configurations inside plugins diretory
for s:file in split(globpath('~/dotfiles/nvim/plugins', '*.vim'), '\n')
  exe 'source' s:file
endfor

" vim-devicons
silent! Plug 'ryanoasis/vim-devicons'

silent! Plug 'editorconfig/editorconfig-vim'
silent! Plug 'farmergreg/vim-lastplace'
silent! Plug 'mattn/emmet-vim'
silent! Plug 'matze/vim-move'
silent! Plug 'mzlogin/vim-markdown-toc'
silent! Plug 'prettier/vim-prettier', { 'do': 'npm install' }
silent! Plug 'tpope/vim-repeat'
silent! Plug 'tpope/vim-surround'
silent! Plug 'wsdjeg/vim-fetch'
silent! Plug 'Xvezda/vim-nobin'
silent! call plug#end()

" import separate configurations inside plugins diretory
for s:file in split(globpath('~/dotfiles/nvim/settings', '*.vim'), '\n')
  exe 'source' s:file
endfor

" neovide specific setting
if exists('g:neovide')
  source $HOME/dotfiles/nvim/neovide.vim
endif
