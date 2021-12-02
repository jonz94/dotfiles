if !exists('*jonz94#save_and_source')
  function! jonz94#save_and_source() abort
    if &filetype == 'vim'
      :silent! write
      :source %
    elseif &filetype == 'lua'
      :silent! write
      :luafile %
    endif
  endfunction
endif
