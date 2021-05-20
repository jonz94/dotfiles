" git

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

silent! Plug 'airblade/vim-gitgutter'
silent! Plug 'tpope/vim-fugitive'

" related key mappings
nnoremap <silent> <leader><leader>g :G<CR><C-w>o
nnoremap <silent> <leader>gfa :Dispatch! git fetch --all --prune<CR>
nnoremap <silent> <leader>gl :Dispatch! git pull<CR>
nnoremap <silent> <leader>gp :Dispatch! git push<CR>
