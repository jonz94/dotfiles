-- ignore this file if neovim is running inside vscode
if vim.fn.exists('g:vscode') == 1 then
  return
end

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
