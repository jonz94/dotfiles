local M = {}

-- credits: https://dev.to/voyeg3r/writing-useful-lua-functions-to-my-neovim-14ki
M.preserve = function(arguments)
  arguments = string.format('keepmarks keepjumps keeppatterns execute %q', arguments)

  local line, col = unpack(vim.api.nvim_win_get_cursor(0))

  vim.api.nvim_command(arguments)

  local lastline = vim.fn.line('$')

  if line > lastline then
    line = lastline
  end

  vim.api.nvim_win_set_cursor(0, { line, col })
end

return M
