augroup JsoncDetect
  autocmd!
  autocmd BufReadPost *.omp.json set filetype=jsonc
  autocmd BufReadPost settings.json set filetype=jsonc
  autocmd BufReadPost .c[sS]pell.json set filetype=jsonc
  autocmd BufReadPost c[sS]pell.json set filetype=jsonc
  autocmd BufReadPost cspell.config.json set filetype=jsonc
augroup END
