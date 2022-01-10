if vim.g.vscode then
  return
end

if not pcall(require, 'neogit') then
  return
end

local neogit = require('neogit')

neogit.setup({
  disable_context_highlighting = true,
  signs = {
    -- { CLOSED, OPENED }
    section = { '', '' },
    item = { '', '' },
    hunk = { '', '' },
  },
})

vim.keymap.set('n', '<Leader>gg', function()
  neogit.open()
end)

vim.keymap.set('n', '<Leader><Leader>g', function()
  neogit.open()
end)
