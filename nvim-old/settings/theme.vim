" theming

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

" turn on syntax highlight
syntax on

" use onedark colorscheme
silent! colorscheme onedark

" use dark background
set background=dark

" show syntax highlight group name under the cursor
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" key mapping for show highlight group name
nnoremap <Leader>si :call <SID>SynStack()<CR>
