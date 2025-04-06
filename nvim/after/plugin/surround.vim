" https://github.com/tpope/vim-surround

nmap <Leader>ds <Plug>Dsurround
nmap cs         <Plug>Csurround
nmap cS         <Plug>CSurround
nmap ys         <Plug>Ysurround
nmap yS         <Plug>YSurround
nmap yss        <Plug>Yssurround
nmap ySs        <Plug>YSsurround
nmap ySS        <Plug>YSsurround
xmap S          <Plug>VSurround
xmap gS         <Plug>VgSurround

if !exists('g:surround_no_insert_mappings') || ! g:surround_no_insert_mappings
  if !hasmapto('<Plug>Isurround', 'i') && '' == mapcheck('<C-S>', 'i')
    imap <C-S> <Plug>Isurround
  endif
  imap   <C-G>s <Plug>Isurround
  imap   <C-G>S <Plug>ISurround
endif
