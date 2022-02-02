if vim.g.vscode then
  return
end

if not pcall(require, 'indent_blankline') then
  return
end

require('indent_blankline').setup({
  char = '│',
  buftype_exclude = { 'terminal', 'nofile', 'help' },
  space_char_blankline = ' ',
  show_current_context = true,
  -- show_current_context_start = true,
  context_highlight_list = { 'Normal' },
})
