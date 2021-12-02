if vim.g.vscode then
  return
end

if not pcall(require, 'nvim-tree') then
  return
end

local nvim_tree = require('nvim-tree')
local icons = require('jonz94.icons')
local nnoremap = vim.keymap.nnoremap

nvim_tree.setup({
  update_focused_file = {
    enable = true,
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

nnoremap({ '<C-n>', function() nvim_tree.toggle() end })
