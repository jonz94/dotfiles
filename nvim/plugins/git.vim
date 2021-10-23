" git

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

if has('nvim-0.5')
  silent! Plug 'lewis6991/gitsigns.nvim'
else
  silent! Plug 'airblade/vim-gitgutter'
endif

silent! Plug 'tpope/vim-fugitive'

" related key mappings
nnoremap <silent> <leader><leader>g :G<CR><C-w>o
nnoremap <silent> <leader>gfa :Dispatch! git fetch --all --prune<CR>
nnoremap <silent> <leader>gl :Dispatch! git pull<CR>
nnoremap <silent> <leader>gp :Dispatch! git push<CR>

" abort git commit when editing the commit log message
command AbortGitCommit :cq!
command CancelGitCommit :cq!
command GitAbortCommit :cq!
command GitCancelCommit :cq!
