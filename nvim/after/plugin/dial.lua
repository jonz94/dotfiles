local dial_status_ok, map = pcall(require, 'dial.map')
if not dial_status_ok then
  return
end

local augend = require('dial.augend')

require('dial.config').augends:register_group({
  default = {
    augend.integer.alias.decimal_int,
    augend.date.alias['%Y/%m/%d'],
    augend.date.alias['%Y-%m-%d'],
    augend.date.alias['%H:%M:%S'],
    augend.semver.alias.semver,

    -- boolean
    augend.constant.alias.bool,
    augend.constant.new({
      elements = { 'True', 'False' },
      word = true,
      cyclic = true,
    }),
    augend.constant.new({
      elements = { 'TRUE', 'FALSE' },
      word = true,
      cyclic = true,
    }),

    -- misc
    augend.constant.new({
      elements = { '==', '!=' },
      word = false,
      cyclic = true,
    }),
    augend.constant.new({
      elements = { '===', '!==' },
      word = false,
      cyclic = true,
    }),
    augend.constant.new({
      elements = { '||', '&&' },
      word = false,
      cyclic = true,
    }),
    augend.constant.new({
      elements = { 'public', 'private' },
      word = true,
      cyclic = true,
    }),
  },
})

-- stylua: ignore start
vim.keymap.set('n', '<C-a>',  map.inc_normal() )
vim.keymap.set('n', '<C-x>',  map.dec_normal() )
vim.keymap.set('v', '<C-a>',  map.inc_visual() )
vim.keymap.set('v', '<C-x>',  map.dec_visual() )
vim.keymap.set('v', 'g<C-a>', map.inc_gvisual())
vim.keymap.set('v', 'g<C-x>', map.dec_gvisual())
