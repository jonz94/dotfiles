" fix input method issue

if has('unix')
  " vim-barbaric for Linux or macOS
  silent! Plug 'rlue/vim-barbaric'
elseif has('win64') && filereadable('C:\Windows\System32\libxkbswitch64.dll')
  " xkb-switch for 64-bits Windows
  silent! Plug 'lyokha/vim-xkbswitch'
  let g:XkbSwitchEnabled = 1
  let g:XkbSwitchLib = 'C:\Windows\System32\libxkbswitch64.dll'
 elseif has('win32') && filereadable('C:\Windows\System32\libxkbswitch32.dll')
  " xkb-switch for 32-bits Windows
  silent! Plug 'lyokha/vim-xkbswitch'
  let g:XkbSwitchEnabled = 1
  let g:XkbSwitchLib = 'C:\Windows\System32\libxkbswitch32.dll'
endif
