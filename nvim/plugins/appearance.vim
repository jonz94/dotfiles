" appearance

if !exists('g:vscode')
  " show absolute line number on current line
  set number

  " show relative line number on non-current line
  set relativenumber

  " show cursor line
  set cursorline

  " always show sign column
  set signcolumn=yes

  " onedark theme
  silent! Plug 'joshdick/onedark.vim'

  " italic comment
  let g:onedark_terminal_italics = 1
  set t_ZH=[3m
  set t_ZR=[23m
  highlight Comment cterm=italic

  if has('nvim-0.5')
    " icons
    silent! Plug 'kyazdani42/nvim-web-devicons'

    " tabline
    silent! Plug 'romgrk/barbar.nvim'

    " status line
    silent! Plug 'glepnir/galaxyline.nvim'
  else
    " icons
    silent! Plug 'ryanoasis/vim-devicons'
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
  endif

  " true colors
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif

  " indentLine setting
  if has('nvim-0.5')
    silent! Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
  elseif has('nvim')
    silent! Plug 'Yggdroot/indentLine'
    silent! Plug 'lukas-reineke/indent-blankline.nvim'
  else
    silent! Plug 'Yggdroot/indentLine'
  endif

  " use one of ¦, ┆, │, ⎸, or ▏
  let g:indentLine_char = '│'

  " do not show indent lines on these type of buffer
  let g:indent_blankline_buftype_exclude = ['terminal', 'nofile', 'help']

  " make tabs, trailing whitespace, and non-breaking spaces visible
  set list
  set listchars=tab:→\ ,nbsp:.,trail:⋅,extends:❯,precedes:❮
endif
