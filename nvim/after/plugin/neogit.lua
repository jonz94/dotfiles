if vim.g.vscode then
  return
end

if not pcall(require, 'neogit') then
  return
end

local neogit = require('neogit')
local nnoremap = vim.keymap.nnoremap

neogit.setup({
  disable_context_highlighting = true,
  signs = {
    -- { CLOSED, OPENED }
    section = { '', '' },
    item = { '', '' },
    hunk = { '', '' },
  },
})

nnoremap({ '<Leader>gg',        function () neogit.open() end })
nnoremap({ '<Leader><Leader>g', function () neogit.open() end })
