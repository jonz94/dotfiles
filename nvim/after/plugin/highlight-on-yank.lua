vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'Substitute',
      timeout = 150,
      on_macro = true,
    })
  end,
  group = vim.api.nvim_create_augroup('HighlightOnYank', { clear = true }),
})
