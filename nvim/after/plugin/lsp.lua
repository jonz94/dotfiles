if vim.g.vscode then
  return
end

if not pcall(require, 'nvim-lsp-installer') then
  return
end

local lsp_installer = require('nvim-lsp-installer')

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = ' ',
      server_pending = ' ',
      server_uninstalled = ' ',
    },
  },
})

lsp_installer.on_server_ready(function(server)
  local options = {}

  if server.name == 'sumneko_lua' then
    if pcall(require, 'nvim-lsp-installer') then
      options = require('lua-dev').setup()
    end
  end

  server:setup(options)
end)

-- go to definition
vim.keymap.set('n', '<Leader>gd', function()
  vim.lsp.buf.definition()
end)

vim.keymap.set('n', '<Leader>dj', function()
  vim.diagnostic.next()
end)

vim.keymap.set('n', '<Leader>dk', function()
  vim.diagnostic.prev()
end)
