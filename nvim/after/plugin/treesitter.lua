if vim.g.vscode then
  return
end

if not pcall(require, 'nvim-treesitter') then
  return
end

require('nvim-treesitter.configs').setup({
  ensure_installed = nil,
  highlight = {
    enable = true,
    disable = { 'css' },
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  endwise = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
})

vim.keymap.set('n', '<Leader>tp', '<Cmd>TSPlaygroundToggle<CR>')
vim.keymap.set('n', '<Leader>th', '<Cmd>TSHighlightCapturesUnderCursor<CR>')
