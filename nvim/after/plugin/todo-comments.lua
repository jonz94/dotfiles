if vim.g.vscode then
  return
end

local todo_comments_status_ok, todo_comments = pcall(require, 'todo-comments')
if not todo_comments_status_ok then
  return
end

todo_comments.setup()
