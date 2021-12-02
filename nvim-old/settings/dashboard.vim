" ignore this file if neovim is running inside vscode or running normal vim
if exists('g:vscode') || !has('nvim')
  finish
endif

if has('nvim-0.5')
  " use telescope for neovim nightly
  let g:dashboard_default_executive = 'telescope'

  " change sessions' save location
  let g:dashboard_session_directory = stdpath('data') . '/dashboard-sessions-nightly'
elseif has('nvim')
  " use fzf for neovim stable
  let g:dashboard_default_executive = 'fzf'

  " change sessions' save location
  let g:dashboard_session_directory = stdpath('data') . '/dashboard-sessions'
endif

" customize header
let g:dashboard_custom_header = [
      \ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
      \ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
      \ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
      \ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
      \ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
      \ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
      \]

" customize footer
let g:dashboard_custom_footer = []

" key mappings
nnoremap <leader>ss :<C-u>SessionSave<CR>
nnoremap <leader>sl :<C-u>SessionLoad<CR>
