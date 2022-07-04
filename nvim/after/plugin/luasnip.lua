if vim.g.vscode then
  return
end

local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then
  return
end

-- from https://github.com/L3MON4D3/LuaSnip/blob/eb84bb89933141fa0cd0683cb960fef975106dfd/lua/luasnip/loaders/from_vscode.lua#L118-L122
local function get_snippet_runtimepath()
  return vim.tbl_map(function(item)
    return vim.fn.fnamemodify(item, ':h')
  end, vim.api.nvim_get_runtime_file('package.json', true))
end

luasnip.config.set_config({
  history = true,
  -- update more often, :h events for more info.
  updateevents = 'TextChanged,TextChangedI',
})

-- load snippets from other plugins (e.g. rafamadriz/friendly-snippets) and vscode
local snippets_provided_by_other_vim_plugins = get_snippet_runtimepath()
local snippets_from_my_vscode = { '~/dotfiles/vscode' }
local paths = vim.list_extend(snippets_provided_by_other_vim_plugins, snippets_from_my_vscode)
require('luasnip.loaders.from_vscode').load({ paths = paths })

vim.cmd([[
  imap <silent><expr> <c-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'
  inoremap <silent> <c-k> <cmd>lua require('luasnip').jump(-1)<CR>

  imap <silent><expr> <c-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-l>'
  imap <silent><expr> <c-h> luasnip#choice_active() ? '<Plug>luasnip-prev-choice' : '<c-h>'

  snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(-1)<CR>
]])
