if vim.g.vscode then
  return
end

local neoscroll_status_ok, neoscroll = pcall(require, 'neoscroll')
if not neoscroll_status_ok then
  return
end

neoscroll.setup()

local keymap = {
  ['<C-u>'] = function()
    neoscroll.ctrl_u({ duration = 80 })
  end,
  ['<C-d>'] = function()
    neoscroll.ctrl_d({ duration = 80 })
  end,
  ['<C-b>'] = function()
    neoscroll.ctrl_b({ duration = 250 })
  end,
  ['<C-f>'] = function()
    neoscroll.ctrl_f({ duration = 250 })
  end,
  ['<C-y>'] = function()
    neoscroll.scroll(-0.1, { move_cursor = false, duration = 80 })
  end,
  ['<C-e>'] = function()
    neoscroll.scroll(0.1, { move_cursor = false, duration = 80 })
  end,
  ['zt'] = function()
    neoscroll.zt({ half_win_duration = 150 })
  end,
  ['zz'] = function()
    neoscroll.zz({ half_win_duration = 150 })
  end,
  ['zb'] = function()
    neoscroll.zb({ half_win_duration = 150 })
  end,
}

local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end
