if vim.g.vscode then
  return
end

if not pcall(require, 'todo-comments') then
  return
end

require('todo-comments').setup()
