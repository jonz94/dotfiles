" sidebar

if !exists('g:vscode')
  if has('nvim-0.5')
    silent! Plug 'kyazdani42/nvim-tree.lua'

    " shows indent markers when folders are open
    let g:nvim_tree_indent_markers = 1

    " opens the tree when entering vim
    let g:nvim_tree_auto_open = 0

    " append a trailing slash to folder names
    let g:nvim_tree_add_trailing = 1

    " customize icon
    let g:nvim_tree_icons = {
          \ 'default': '',
          \ 'symlink': '',
          \ 'git': {
            \   'unstaged': "",
            \   'staged': "✓",
            \   'unmerged': "",
            \   'renamed': "",
            \   'untracked': "",
            \   'ignored': "",
            \   },
            \ 'folder': {
              \   'default': "",
              \   'open': "",
              \   'empty': "",
              \   'empty_open': "",
              \   'symlink': "",
              \   'symlink_open': "",
              \   },
              \   'lsp': {
                \     'hint': "",
                \     'info': "",
                \     'warning': "",
                \     'error': "",
                \   },
                \ }

    " key mappings
    nnoremap <C-n> <cmd>NvimTreeToggle<CR>
    nnoremap <leader>nr <cmd>NvimTreeRefresh<CR>
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
