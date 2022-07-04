if vim.g.vscode then
  return
end

local hlargs_status_ok, hlargs = pcall(require, 'hlargs')
if not hlargs_status_ok then
  return
end

hlargs.setup()
