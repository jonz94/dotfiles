if !exists('g:vscode')
  " ===[ php file only ]===
  autocmd FileType php set shiftwidth=4
  autocmd FileType php set tabstop=4

  " ===[ php-cs-fixer ]===
  autocmd BufNewFile,BufRead *.php_cs      set syntax=php
  autocmd BufNewFile,BufRead *.php_cs.dist set syntax=php
endif
