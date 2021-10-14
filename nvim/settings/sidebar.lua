-- ignore this file if neovim is running inside vscode
if vim.fn.exists('g:vscode') == 1 then -- 0: false, 1: true
  return
end

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

require'nvim-tree'.setup()
