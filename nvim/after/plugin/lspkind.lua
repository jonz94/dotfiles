if vim.g.vscode then
  return
end

if not pcall(require, 'lspkind') then
  return
end

require('lspkind').init()
