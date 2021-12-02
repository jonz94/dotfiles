" goyo

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

silent! Plug 'junegunn/goyo.vim'

" enable line number
let g:goyo_linenr=1

" key mappings
nnoremap <silent> <leader>zz :Goyo<CR>
nnoremap <silent> <leader><leader>zz :Goyo 120<CR>
