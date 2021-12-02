if vim.g.vscode then
  return
end

if not pcall(require, 'Comment') then
  return
end

require('Comment').setup()
