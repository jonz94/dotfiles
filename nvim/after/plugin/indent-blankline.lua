if vim.g.vscode then
  return
end

local indent_blankline_status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not indent_blankline_status_ok then
  return
end

indent_blankline.setup({
  char = '│',
  buftype_exclude = { 'terminal', 'nofile', 'help' },
  space_char_blankline = ' ',
  show_current_context = true,
  -- show_current_context_start = true,
  context_highlight_list = { 'Normal' },
})
