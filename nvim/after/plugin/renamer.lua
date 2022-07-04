if vim.g.vscode then
  -- stylua: ignore start
  vim.keymap.set('n', '<Leader>r',  '<Cmd>call VSCodeNotify("editor.action.rename")<CR>')
  vim.keymap.set('v', '<Leader>r',  '<Cmd>call VSCodeNotify("editor.action.rename")<CR>')
  -- stylua: ignore end

  return
end

local renamer_status_ok, renamer = pcall(require, 'renamer')
if not renamer_status_ok then
  return
end

renamer.setup()

-- stylua: ignore start
vim.keymap.set('n', '<Leader>r', function() renamer.rename() end)
vim.keymap.set('v', '<Leader>r', function() renamer.rename() end)
