" git

if !exists('g:vscode')
  silent! Plug 'airblade/vim-gitgutter'
  silent! Plug 'tpope/vim-fugitive'

  " related key mappings
  nnoremap <silent> <leader><leader>g :G<CR><C-w>o
  nnoremap <silent> <leader>gfa :Dispatch! git fetch --all<CR>
  nnoremap <silent> <leader>gl :Dispatch! git pull<CR>
  nnoremap <silent> <leader>gp :Dispatch! git push<CR>
endif
