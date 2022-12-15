if vim.g.vscode then
  return
end

local neo_tree_status_ok, neo_tree = pcall(require, 'neo-tree')
if not neo_tree_status_ok then
  return
end

local icons = require('jonz94.icons')

neo_tree.setup({
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = '│',
      last_indent_marker = '└',
      highlight = 'NeoTreeIndentMarker',
      -- expander config, needed for nesting files
      with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = '',
      expander_expanded = '',
      expander_highlight = 'NeoTreeExpander',
    },
    diagnostics = {
      symbols = {
        error = icons.error,
        hint = icons.hint,
        info = icons.info,
        warn = icons.warn,
      },
    },
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = '',
      default = '',
    },
    modified = {
      symbol = '[+]',
      highlight = 'NeoTreeModified',
    },
    name = {
      trailing_slash = true,
      use_git_status_colors = true,
      highlight = 'NeoTreeFileName',
    },
    git_status = {
      symbols = {
        -- Change type
        added = '✚',
        modified = '',
        deleted = '✖',
        renamed = '',
        -- Status type
        untracked = '',
        ignored = '',
        unstaged = '',
        staged = '',
        conflict = '',
      },
    },
  },
})

vim.keymap.set('n', '<C-n>', '<Cmd>Neotree toggle<CR>')
