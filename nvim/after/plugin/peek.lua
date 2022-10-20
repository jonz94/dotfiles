local peek_status_ok, peek = pcall(require, 'peek')
if not peek_status_ok then
  return
end

peek.setup()

local function peekToggle()
  if peek.is_open() then
    peek.close()
  else
    peek.open()
  end
end

vim.keymap.set('n', '<Leader>pt', function()
  peekToggle()
end)
