if vim.g.vscode then
  return
end

if not pcall(require, 'nvim-autopairs') then
  return
end

require('nvim-autopairs').setup()
