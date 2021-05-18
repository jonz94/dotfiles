-- shows indent markers when folders are open
vim.g.nvim_tree_indent_markers = 1

-- append a trailing slash to folder names
vim.g.nvim_tree_add_trailing = 1

-- customize icon
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git= {
    unstaged = '',
    staged = '✓',
    unmerged = '',
    renamed = '',
    untracked = '',
    ignored = '',
  },
  folder= {
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
    symlink_open = '',
  },
  lsp= {
    hint = '',
    info = '',
    warning = '',
    error = '',
  },
}

