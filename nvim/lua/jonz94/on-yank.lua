local M = {}

M.highlight = function()
  vim.highlight.on_yank({
    higroup = 'Substitute',
    timeout = 150,
    on_macro = true,
  })
end

return M
