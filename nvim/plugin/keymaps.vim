scriptencoding utf-8

if exists('g:vscode')
  nnoremap <Leader><Tab>     <Cmd>w<CR>
  nnoremap <Leader>q         <Cmd>Quit<CR>
  nnoremap <Leader><Leader>q <Cmd>Qall<CR>
  nnoremap <Leader>db        <Cmd>Quit<CR>
  nnoremap <Leader>bd        <Cmd>Quit<CR>

  nnoremap <C-h>             <Cmd>call VSCodeNotify('workbench.action.focusSideBar')<CR>
else
  " write file in insert mode
  inoremap <C-M-s> <Cmd>w<CR>

  " write file in insert mode, and then return to normal mode
  inoremap <C-s> <Cmd>w<CR>

  " quit file
  nnoremap <Leader>q         <Cmd>q<CR>
  nnoremap <Leader>Q         <Cmd>q!<CR>
  nnoremap <Leader><Leader>q <Cmd>qall<CR>
  nnoremap <Leader><Leader>Q <Cmd>qall!<CR>

  " map `Q` as `quit file`
  " note: we can still enter ex mode via `gQ`
  nnoremap Q <Cmd>q<CR>

  " write and quit
  nnoremap <Leader><Tab> <Cmd>wq<CR>

  " move through buffer
  nnoremap <Leader>bn <Cmd>bn<CR>
  nnoremap <Leader>nn <Cmd>bn<CR>
  nnoremap <Leader>bp <Cmd>bp<CR>
  nnoremap <Leader>pp <Cmd>bp<CR>

  " delete buffer
  nnoremap <Leader>db <Cmd>bd<CR>
  nnoremap <Leader>bd <Cmd>bd<CR>

  " christoomey/vim-tmux-navigator
  nnoremap <silent> <C-h> <Cmd>TmuxNavigateLeft<CR>
  nnoremap <silent> <C-j> <Cmd>TmuxNavigateDown<CR>
  nnoremap <silent> <C-k> <Cmd>TmuxNavigateUp<CR>
  nnoremap <silent> <C-l> <Cmd>TmuxNavigateRight<CR>
endif

" write file
nnoremap <Leader>w         <Cmd>w<CR>
nnoremap <Leader>W         <Cmd>w!<CR>
nnoremap <Leader><Leader>w <Cmd>wall<CR>
nnoremap <Leader><Leader>W <Cmd>wall!<CR>

" yank/delete, and put it into system clipboard
nnoremap <Leader>dd "+dd
nnoremap <Leader>yy "+yy
vnoremap <Leader>d  "+d
vnoremap <Leader>y  "+y
nnoremap <Leader><leader>d "+d
nnoremap <Leader><leader>y "+y

" yank/delete, and throw it away
nnoremap <Leader>DD "_dd
nnoremap <Leader>YY "_yy
vnoremap <Leader>D  "_d
vnoremap <Leader>Y  "_y
nnoremap <Leader><leader>D "_d
nnoremap <Leader><leader>Y "_y

" save and source this file
nnoremap <Leader><Leader>x <Cmd>call jonz94#save_and_source()<CR>

" run last command
nnoremap <Leader><Leader>c :<Up>

" edit current dir
nnoremap <Leader>e. <Cmd>e<space>.<CR>
nnoremap <Leader>e, <Cmd>e<space>.<CR>

" show next matched string at the center of screen
nnoremap n nzz
nnoremap N Nzz

" sort
vnoremap <Leader>ss :sort<CR>
vnoremap <Leader>si :sort i<CR>

" move cursor by terminal rows, not lines, unless a count is provided
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" I hate hoding shift
nnoremap <Leader>\` ~
nnoremap <Leader>1 !
nnoremap <Leader>2 @
nnoremap <Leader>3 #
nnoremap <Leader>4 $
nnoremap <Leader>5 %
nnoremap <Leader>6 ^
nnoremap <Leader>7 &
nnoremap <Leader>8 *
nnoremap <Leader>9 (
nnoremap <Leader>0 )
nnoremap <Leader>; :

" clears hlsearch after doing a search, otherwise just type enter
"nnoremap <expr> <CR> {-> v:hlsearch ? ":noh\<CR>" : '<CR>'}()
"
" slightly modified version
" the ":\<BS>" part I added is to clean ":noh" showing up in the bottom left corner
nnoremap <expr> <CR> {-> v:hlsearch ? ":noh\<CR>:\<BS>" : '<CR>'}()

" clear last search pattern register (a.k.a. "/)
noremap <silent> <Leader>cs <Cmd>let @/ = ''<CR>

" map u to scroll up half page when browsing help file
nnoremap <expr> u {-> &buftype == 'help' ? '<Cmd>lua require("neoscroll").scroll(-vim.wo.scroll, { move_cursor = true, duration = 80 })<CR>' : 'u'}()

" map d to scroll down half page when browsing help file
nnoremap <expr> d {-> &buftype == 'help' ? '<Cmd>lua require("neoscroll").scroll(vim.wo.scroll, { move_cursor = true, duration = 80 })<CR>' : 'd'}()

" fold
nnoremap <Leader>zf zfip

" quickly hidden search highlight
nnoremap <Leader>nh <Cmd>nohl<CR>

" format document without jumping to first line
nnoremap <Leader>g= <Cmd>norm! gg=G<C-o><CR>

" plugin management
nnoremap <Leader>ps <Cmd>PackerSync<CR>
nnoremap <Leader>pu <Cmd>PackerSync<CR>
