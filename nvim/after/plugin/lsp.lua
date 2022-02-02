if vim.g.vscode then
  return
end

if not pcall(require, 'nvim-lsp-installer') then
  return
end

local lsp_installer = require('nvim-lsp-installer')

-- stylua: ignore start
local function on_attach()
  vim.keymap.set('n', 'K',          function() vim.lsp.buf.hover()      end, { buffer = 0 })
  vim.keymap.set('n', '<Leader>gd', function() vim.lsp.buf.definition() end, { buffer = 0 })
  vim.keymap.set('n', '<Leader>gr', function() vim.lsp.buf.references() end, { buffer = 0 })
  vim.keymap.set('n', '<Leader>dj', function() vim.diagnostic.next()    end, { buffer = 0 })
  vim.keymap.set('n', '<Leader>dk', function() vim.diagnostic.prev()    end, { buffer = 0 })
  vim.keymap.set('n', '<Leader>r',  function() vim.lsp.buf.rename()     end, { buffer = 0 })
end
-- stylua: ignore end

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
  local options = {
    on_attach = on_attach,
  }

  if server.name == 'sumneko_lua' then
    if pcall(require, 'nvim-lsp-installer') then
      options = require('lua-dev').setup({
        lspconfig = {
          on_attach = on_attach,
        },
      })
    end
  end

  server:setup(options)
end)
