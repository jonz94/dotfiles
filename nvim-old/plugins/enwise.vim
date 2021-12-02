" enwise

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

" main plugin
silent! Plug 'mapkts/enwise'

" enable enwise globally
let g:enwise_enable_globally = 1

" related key mappings
nnoremap <leader>te :EnwiseToggle<CR>
