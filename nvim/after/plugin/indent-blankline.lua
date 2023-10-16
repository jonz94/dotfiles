if vim.g.vscode then
  return
end

local indent_blankline_status_ok, indent_blankline = pcall(require, 'ibl')
if not indent_blankline_status_ok then
  return
end

indent_blankline.setup()
