" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

" ===[ php file only ]===
autocmd FileType php set shiftwidth=4
autocmd FileType php set tabstop=4

" ===[ php-cs-fixer ]===
autocmd BufNewFile,BufRead *.php_cs      set syntax=php
autocmd BufNewFile,BufRead *.php_cs.dist set syntax=php
