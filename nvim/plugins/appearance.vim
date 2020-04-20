" appearance

if !exists('g:vscode')
  " onedark theme
  silent! Plug 'joshdick/onedark.vim'

  " show cursor line
  set cursorline
  set number relativenumber
  set ruler

  " italic comment
  let g:onedark_terminal_italics = 1
  set t_ZH=[3m
  set t_ZR=[23m
  highlight Comment cterm=italic

  " vim-airline
  silent! Plug 'vim-airline/vim-airline'
  let g:airline_theme = 'onedark'
  let g:airline_extensions = ['branch', 'tabline', 'ctrlp']
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''

  " indentLine setting
  silent! Plug 'Yggdroot/indentLine'
  silent! Plug 'lukas-reineke/indent-blankline.nvim'
  " use one of ¦, ┆, │, ⎸, or ▏
  let g:indentLine_char = '│'


  " make tabs, trailing whitespace, and non-breaking spaces visible
  set list
  set listchars=tab:→\ ,nbsp:.,trail:⋅,extends:❯,precedes:❮
endif
