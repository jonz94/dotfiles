if vim.g.vscode then
  -- stylua: ignore start
  vim.keymap.set('n', '<Leader>zz',        '<Cmd >call VSCodeNotify("workbench.action.toggleZenMode")<CR>')
  vim.keymap.set('n', '<Leader><Leader>z', '<Cmd >call VSCodeNotify("workbench.action.toggleZenMode")<CR>')
  -- stylua: ignore end

  return
end

if not pcall(require, 'twilight') then
  return
end

if not pcall(require, 'zen-mode') then
  return
end

require('twilight').setup()

local zen = require('zen-mode')

zen.setup({
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
  zen.toggle({
    window = {
      width = 120,
    },
  })
end)

vim.keymap.set('n', '<Leader>zz', function()
  zen.toggle()
end)
