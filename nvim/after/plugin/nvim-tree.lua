if vim.g.vscode then
  return
end

local nvim_tree_status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not nvim_tree_status_ok then
  return
end

local icons = require('jonz94.icons')

nvim_tree.setup({
  respect_buf_cwd = true,
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
  renderer = {
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        git = {
          unstaged = '',
          staged = '✓',
          unmerged = '',
          renamed = '',
          untracked = '',
          ignored = '',
        },
        folder = {
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
      },
    },
  },
})

vim.keymap.set('n', '<C-n>', function()
  nvim_tree.toggle()
end)
