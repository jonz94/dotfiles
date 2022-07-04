if vim.g.vscode then
  return
end

local nvim_autopairs_status_ok, nvim_autopairs = pcall(require, 'nvim-autopairs')
if not nvim_autopairs_status_ok then
  return
end

nvim_autopairs.setup()
