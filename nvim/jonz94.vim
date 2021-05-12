" prevent utf-8 characters issue
scriptencoding utf-8
set encoding=utf-8

" basic
set nocompatible
set autoindent
set expandtab
set mouse=a
set shiftwidth=2
set tabstop=2
set path+=**
set wildmenu
set endofline
set fixendofline
set hlsearch
set incsearch

" set leader key
let mapleader=" "

" vim-plug
silent! call plug#begin('~/.local/share/nvim/plugged')

" import separate plugin configurations inside plugins diretory
for s:file in split(globpath('~/dotfiles/nvim/plugins', '*.vim'), '\n')
  exe 'source' s:file
endfor

" vim-devicons
silent! Plug 'ryanoasis/vim-devicons'

silent! Plug 'airblade/vim-gitgutter'
silent! Plug 'editorconfig/editorconfig-vim'
silent! Plug 'farmergreg/vim-lastplace'
silent! Plug 'jonz94/enwise'
silent! Plug 'konfekt/fastfold'
silent! Plug 'mattn/emmet-vim'
silent! Plug 'matze/vim-move'
silent! Plug 'mzlogin/vim-markdown-toc'
silent! Plug 'prettier/vim-prettier', { 'do': 'npm install' }
silent! Plug 'tpope/vim-dispatch'
silent! Plug 'tpope/vim-fugitive'
silent! Plug 'tpope/vim-repeat'
silent! Plug 'tpope/vim-surround'
silent! Plug 'wsdjeg/vim-fetch'
silent! Plug 'Xvezda/vim-nobin'
silent! call plug#end()

" import separate configurations inside plugins diretory
for s:file in split(globpath('~/dotfiles/nvim/settings', '*.vim'), '\n')
  exe 'source' s:file
endfor

" ===[ Key Mapping ]===
" swap : and ;
" but will meet up some extra-feature(bug) while using :ls follow by :b
"nnoremap  :  ;
"nnoremap  ;  :
"vnoremap  :  ;
"vnoremap  ;  :
" press Enter to quickly enter command mode
nnoremap <CR> :
nnoremap <S-CR> <CR>
" write file
nnoremap <C-s> :w<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader><leader>w :wall<CR>
" write file in insert mode
inoremap <C-M-s> <C-o>:w<CR>
inoremap ;;w <C-o>:w<CR>
" write file in insert mode, and then return to normal mode
inoremap <C-s> <Esc>:w<CR>l
inoremap ;w <Esc>:w<CR>l
" quit file
nnoremap <leader>q :q<CR>
nnoremap <leader><leader>q :qall<CR>
nnoremap <leader><leader>Q :q!<CR>
" map `Q` as `quit file`
" note: we can still enter ex mode via `gQ`
nnoremap Q :q<CR>
" write and quit
nnoremap <leader><Tab> :wq<CR>
" quickly type :help<space>
nnoremap <leader>h :help<space>
" edit current dir
nnoremap <leader>e. :e<space>.<CR>
nnoremap <leader>e, :e<space>.<CR>
" show next matched string at the center of screen
nnoremap n nzz
nnoremap N Nzz
" sort
vnoremap <leader>ss :sort<CR>
vnoremap <leader>si :sort i<CR>
" reload vimrc
nnoremap <leader>r :source $MYVIMRC<CR>
" list buffer
nnoremap <leader>ls :ls<CR>
" move through buffer
nnoremap <leader>bn :bn<CR>
nnoremap <leader>nn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>pp :bp<CR>
" delete buffer
nnoremap <leader>d :bd<CR>
" fold
nnoremap <leader>zf zfip
" quickly hidden search highlight
nnoremap <leader>nh :nohl<CR>
" git
nnoremap <silent> <leader><leader>g :G<CR><C-w>o
nnoremap <silent> <leader>gp :Dispatch! git push<CR>
nnoremap <silent> <leader>gl :Dispatch! git pull<CR>
" Plugin management
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>pU :PlugUpgrade<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>

if !exists('g:vscode')
  " ===[ Highlight effect to limit 80 characters in single line ]===
  " note: this setting must put in the bottom of the file.
  " Put a light-grey vertical line on column 81
  highlight ColorColumn ctermbg=245 guibg=#2c2d27
  call matchadd('ColorColumn', '\%81v', 100)
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
  highlight CursorLineNr cterm=bold ctermfg=Green
endif
