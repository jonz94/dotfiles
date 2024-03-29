" key mappings

" swap : and ;
" but will meet up some extra-feature(bug) while using :ls follow by :b
"nnoremap  :  ;
"nnoremap  ;  :
"vnoremap  :  ;
"vnoremap  ;  :

if exists('g:vscode')
  nnoremap <leader>w <cmd>Write<CR>
  nnoremap <leader><Tab> <cmd>Write<CR>
  nnoremap <leader>q <cmd>Quit<CR>
  nnoremap <leader><leader>q <cmd>Qall<CR>

  nnoremap <leader>d <cmd>Quit<CR>
else
  " write file
  nnoremap <C-s> :w<CR>
  nnoremap <leader>w :w<CR>
  nnoremap <leader>W :w!<CR>
  nnoremap <leader><leader>w :wall<CR>
  nnoremap <leader><leader>W :wall!<CR>

  " write file in insert mode
  inoremap <C-M-s> <C-o>:w<CR>
  inoremap ;;w <C-o>:w<CR>

  " write file in insert mode, and then return to normal mode
  inoremap <C-s> <Esc>:w<CR>l
  inoremap ;w <Esc>:w<CR>l

  " quit file
  nnoremap <leader>q :q<CR>
  nnoremap <leader>Q :q!<CR>
  nnoremap <leader><leader>q :qall<CR>
  nnoremap <leader><leader>Q :qall!<CR>

  " map `Q` as `quit file`
  " note: we can still enter ex mode via `gQ`
  nnoremap Q :q<CR>

  " write and quit
  nnoremap <leader><Tab> :wq<CR>

  " list buffer
  nnoremap <leader>ls :ls<CR>

  " move through buffer
  nnoremap <leader>bn :bn<CR>
  nnoremap <leader>nn :bn<CR>
  nnoremap <leader>bp :bp<CR>
  nnoremap <leader>pp :bp<CR>

  " delete buffer
  nnoremap <leader>d :bd<CR>
endif

" quickly type :help<space>
nnoremap <leader>he :help<space>

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

" fold
nnoremap <leader>zf zfip

" quickly hidden search highlight
nnoremap <leader>nh :nohl<CR>

" plugin management
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>pU :PlugUpgrade<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>
