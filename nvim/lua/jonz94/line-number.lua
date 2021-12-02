local M = {}

local api = vim.api

M.toggle = function()
  local is_number_line_on = api.nvim_win_get_option(0, 'number')

  api.nvim_win_set_option(0, 'number', not is_number_line_on)
  api.nvim_win_set_option(0, 'relativenumber', not is_number_line_on)
end

return M
