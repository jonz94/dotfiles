local treesj_status_ok, treesj = pcall(require, 'treesj')
if not treesj_status_ok then
  return
end

treesj.setup({
  use_default_keymaps = false,
  max_join_length = 10000,
})

-- stylua: ignore start
vim.keymap.set('n', '<Leader>tj', function() treesj.join()   end)
vim.keymap.set('n', '<Leader>ts', function() treesj.split()  end)
vim.keymap.set('n', '<Leader>tt', function() treesj.toggle() end)
