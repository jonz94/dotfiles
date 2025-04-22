if vim.g.vscode then
  -- stylua: ignore start
  vim.keymap.set('n', '<Leader>zz',        '<Cmd >call VSCodeNotify("workbench.action.toggleZenMode")<CR>')
  vim.keymap.set('n', '<Leader><Leader>z', '<Cmd >call VSCodeNotify("workbench.action.toggleZenMode")<CR>')
  -- stylua: ignore end

  return
end

local twilight_status_ok, twilight = pcall(require, 'twilight')
if twilight_status_ok then
  twilight.setup()
end

local zen_mode_status_ok, zen_mode = pcall(require, 'zen-mode')
if not zen_mode_status_ok then
  return
end

zen_mode.setup({
  window = {
    backdrop = 0.999,
    height = 0.9,
    width = 80,
    options = {
      number = false,
      relativenumber = false,
    },
  },
})

vim.keymap.set('n', '<Leader><Leader>z', function()
  zen_mode.toggle({
    window = {
      width = 120,
    },
  })
end)

vim.keymap.set('n', '<Leader>zz', function()
  zen_mode.toggle()
end)
