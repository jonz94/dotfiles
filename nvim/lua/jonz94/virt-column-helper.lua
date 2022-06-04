local M = {}

M.disable_buffer = function()
  if pcall(require, 'virt-column') then
    require('virt-column').setup_buffer({ virtcolumn = '' })
  end
end

return M
