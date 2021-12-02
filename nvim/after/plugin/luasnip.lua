if vim.g.vscode then
  return
end

if not pcall(require, 'luasnip') then
  return
end

local luasnip = require('luasnip')

luasnip.config.set_config({
  history = true,
  -- update more often, :h events for more info.
  updateevents = 'TextChanged,TextChangedI',
})

require('luasnip.loaders.from_vscode').load()

vim.cmd [[
  imap <silent><expr> <c-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'
  inoremap <silent> <c-k> <cmd>lua require('luasnip').jump(-1)<CR>

  imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'

  snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(-1)<CR>
]]
