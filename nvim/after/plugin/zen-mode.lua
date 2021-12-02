if vim.g.vscode then
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
local nnoremap = vim.keymap.nnoremap

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

nnoremap({ '<Leader>zz', function() zen.toggle() end })

nnoremap({
  '<Leader><Leader>z',
  function()
    zen.toggle({
      window = {
        width = 120,
      },
    })
  end,
})
