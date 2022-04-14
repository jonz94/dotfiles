if vim.g.vscode then
  return
end

if not pcall(require, 'hlargs') then
  return
end

require('hlargs').setup()
