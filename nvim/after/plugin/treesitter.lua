if not pcall(require, 'nvim-treesitter') then
  return
end

local inside_vscode = vim.g.vscode ~= nil

require('nvim-treesitter.configs').setup({
  ensure_installed = nil,
  highlight = {
    enable = not inside_vscode,
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
    enable = not inside_vscode,
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
    enable = not inside_vscode,
  },
  matchup = {
    enable = true,
  },
})

if inside_vscode then
  vim.keymap.set('n', '<Leader>th', '<Cmd>call VSCodeNotify("editor.action.inspectTMScopes")<CR>')
else
  vim.keymap.set('n', '<Leader>tp', '<Cmd>TSPlaygroundToggle<CR>')
  vim.keymap.set('n', '<Leader>th', '<Cmd>TSHighlightCapturesUnderCursor<CR>')
end
