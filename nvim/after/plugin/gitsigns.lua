if vim.g.vscode then
  return
end

local gitsigns_status_ok, gitsigns = pcall(require, 'gitsigns')
if not gitsigns_status_ok then
  return
end

gitsigns.setup({
  signs = {
    add = {
      hl = 'GitSignsAdd',
      text = '▌',
      numhl = 'GitSignsAddNr',
      linehl = 'GitSignsAddLn',
    },
    change = {
      hl = 'GitSignsChange',
      text = '▌',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
  },
})
