if vim.g.vscode then
  -- stylua: ignore start
  vim.keymap.set('n', '<Leader>gd', '<Cmd>call VSCodeNotify("editor.action.revealDefinition")<CR>')
  vim.keymap.set('n', '<Leader>gr', '<Cmd>call VSCodeNotify("references-view.findReferences")<CR>')
  vim.keymap.set('n', '<Leader>dj', '<Cmd>call VSCodeNotify("editor.action.marker.nextInFiles")<CR>')
  vim.keymap.set('n', '<Leader>dk', '<Cmd>call VSCodeNotify("editor.action.marker.prevInFiles")<CR>')
  vim.keymap.set('n', '<Leader>r',  '<Cmd>call VSCodeNotify("editor.action.rename")<CR>')
  -- stylua: ignore end

  return
end

if not pcall(require, 'nvim-lsp-installer') then
  return
end

if pcall(require, 'neodim') then
  require('neodim').setup({
    hide = {
      virtual_text = true,
      signs = true,
      underline = true,
    },
  })
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

local border = {
  { '╭', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '╮', 'FloatBorder' },
  { '│', 'FloatBorder' },
  { '╯', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '╰', 'FloatBorder' },
  { '│', 'FloatBorder' },
}

local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

lsp_installer.on_server_ready(function(server)
  local options = {
    on_attach = on_attach,
    handlers = handlers,
  }

  if server.name == 'sumneko_lua' then
    if pcall(require, 'nvim-lsp-installer') then
      options = require('lua-dev').setup({
        lspconfig = {
          on_attach = on_attach,
          handlers = handlers,
        },
      })
    end
  end

  server:setup(options)
end)
