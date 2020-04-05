if !exists('g:vscode')
  " ===[ netrw file browsing plugin ]===
  let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
  " disable annoying banner
  let g:netrw_banner=0
  " open in prior window
  let g:netrw_browse_split=0
  " open splits to the right
  let g:netrw_altv=1
  " tree view
  let g:netrw_liststyle=3
  " hide all files which are ignored by git
  "let g:netrw_list_hide=netrw_gitignore#Hide()
  " hide se
  "let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
endif
