if vim.g.vscode then
  return
end

local project_nvim_status_ok, project_nvim = pcall(require, 'project_nvim')
if not project_nvim_status_ok then
  return
end

project_nvim.setup()
