if vim.g.vscode then
  return
end

if not pcall(require, 'nvim-tree') then
  return
end

local nvim_tree = require('nvim-tree')
local icons = require('jonz94.icons')

nvim_tree.setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      error = icons.error,
      hint = icons.hint,
      info = icons.info,
      warning = icons.warn,
    },
  },
})

vim.keymap.set('n', '<C-n>', function()
  nvim_tree.toggle()
end)
