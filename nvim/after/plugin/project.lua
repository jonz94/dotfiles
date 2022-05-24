if vim.g.vscode then
  return
end

if not pcall(require, 'project_nvim') then
  return
end

require('project_nvim').setup()
