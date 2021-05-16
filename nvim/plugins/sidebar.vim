" sidebar

if !exists('g:vscode')
  if has('nvim-0.5')
    silent! Plug 'kyazdani42/nvim-tree.lua'

    luafile ~/dotfiles/nvim/plugins/sidebar.lua

    " key mappings
    nnoremap <C-n> <Cmd>NvimTreeToggle<CR>
    nnoremap <leader>nr <Cmd>NvimTreeRefresh<CR>
  else
    " main plugin
    silent! Plug 'preservim/nerdtree'

    " git plugin
    silent! Plug 'Xuyuanp/nerdtree-git-plugin'

    " syntax highlight plugin
    silent! Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    " enable line numbers
    let NERDTreeShowLineNumbers=1

    " make sure relative line numbers are used
    autocmd FileType nerdtree setlocal number relativenumber

    " open NERDTree when entering neovim and put the cursor back in the other window.
    autocmd VimEnter * NERDTree | wincmd p

    " key mappings
    map <C-n> :NERDTreeToggle<CR>
  endif
endif
