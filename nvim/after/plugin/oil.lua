if vim.g.vscode then
  return
end

local oil_status_ok, oil = pcall(require, 'oil')
if not oil_status_ok then
  return
end

oil.setup()
