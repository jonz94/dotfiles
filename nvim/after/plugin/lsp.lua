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

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

local nvim_lsp_installer_status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not nvim_lsp_installer_status_ok then
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

-- stylua: ignore start
local function setup_keymaps()
  vim.keymap.set('n', 'K',          function() vim.lsp.buf.hover()      end, { buffer = 0 })
  vim.keymap.set('n', '<Leader>gd', function() vim.lsp.buf.definition() end, { buffer = 0 })
  vim.keymap.set('n', '<Leader>gr', function() vim.lsp.buf.references() end, { buffer = 0 })
  vim.keymap.set('n', '<Leader>dj', function() vim.diagnostic.next()    end, { buffer = 0 })
  vim.keymap.set('n', '<Leader>dk', function() vim.diagnostic.prev()    end, { buffer = 0 })
  vim.keymap.set('n', '<Leader>r',  function() vim.lsp.buf.rename()     end, { buffer = 0 })
end
-- stylua: ignore end

local function disable_formatter(client)
  client.server_capabilities.documentFormattingProvider = false
end

lsp_installer.setup({
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

-- angularls for angular
lspconfig.angularls.setup({
  handlers = handlers,
  on_attach = setup_keymaps,
})

-- bashls
lspconfig.bashls.setup({
  handlers = handlers,
  on_attach = setup_keymaps,
})

-- cssls
lspconfig.cssls.setup({
  handlers = handlers,
  on_attach = setup_keymaps,
})

-- gopls for golang
lspconfig.gopls.setup({
  handlers = handlers,
  on_attach = function(client)
    disable_formatter(client)
    setup_keymaps()
  end,
})

-- html
lspconfig.html.setup({
  handlers = handlers,
  on_attach = function(client)
    disable_formatter(client)
    setup_keymaps()
  end,
})

-- jsonls
lspconfig.jsonls.setup({
  handlers = handlers,
  on_attach = function(client)
    disable_formatter(client)
    setup_keymaps()
  end,
})

-- lemminx for xml
lspconfig.lemminx.setup({
  handlers = handlers,
  on_attach = setup_keymaps,
})

-- prismals
lspconfig.prismals.setup({
  handlers = handlers,
  on_attach = setup_keymaps,
})

-- pyright
lspconfig.pyright.setup({
  handlers = handlers,
  on_attach = setup_keymaps,
})

-- rust_analyzer
lspconfig.rust_analyzer.setup({
  handlers = handlers,
  on_attach = function(client)
    disable_formatter(client)
    setup_keymaps()
  end,
})

-- sumneko_lua for lua
local luadev = require('lua-dev').setup({
  lspconfig = {
    handlers = handlers,
    on_attach = function(client)
      disable_formatter(client)
      setup_keymaps()
    end,
  },
})
lspconfig.sumneko_lua.setup(luadev)

-- tailwindcss
lspconfig.tailwindcss.setup({
  handlers = handlers,
  on_attach = setup_keymaps,
})

-- tsserver
lspconfig.tsserver.setup({
  handlers = handlers,
  on_attach = function(client)
    disable_formatter(client)
    setup_keymaps()
  end,
})

-- vimls
lspconfig.vimls.setup({
  handlers = handlers,
  on_attach = setup_keymaps,
})

-- volar
lspconfig.volar.setup({
  handlers = handlers,
  on_attach = function(client)
    disable_formatter(client)
    setup_keymaps()
  end,
})
