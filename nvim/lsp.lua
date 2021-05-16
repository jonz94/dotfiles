-- ignore this file if neovim is running inside vscode
if vim.fn.exists('g:vscode') == 1 then
  return
end

local function setup_vimls_for_windows()
  local vimls_config = require'lspinstall/util'.extract_config('vimls')

  vimls_config.default_config.cmd[1] = './node_modules/.bin/vim-language-server.cmd'

  require'lspinstall/servers'.vim = vim.tbl_extend('error', vimls_config, {
    install_script = 'npm init -y --scope=lspinstall && npm install vim-language-server@latest',
  })
end

local function setup_sumneko_lua_for_windows()
  local sumneko_lua_config = require'lspinstall/util'.extract_config('sumneko_lua')

  require'lspinstall/servers'.lua = vim.tbl_deep_extend('force', sumneko_lua_config, {
    install_script = 'curl -s https://api.github.com/repos/sumneko/vscode-lua/releases/latest > out.json && FOR /F delims^=^"^ tokens^=4 %u IN (\'findstr browser_ out.json\') DO curl -L -o sumneko-lua.vsix %u && del out.json && (rd /s /q sumneko-lua || echo.) && mkdir sumneko-lua && tar -xf sumneko-lua.vsix --directory=sumneko-lua && del sumneko-lua.vsix',
    default_config = {
      cmd = {
        './sumneko-lua/extension/server/bin/Windows/lua-language-server.exe',
        '-E',
        './sumneko-lua/extension/server/main.lua',
      },
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
          },
        },
      },
    },
  })
end

local function setup_sumneko_lua()
  require'lspinstall/servers'.lua = vim.tbl_deep_extend('force', require'lspinstall/servers'.lua, {
    default_config = {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
          },
        },
      },
    },
  })
end

local function pre_setup()
  if vim.fn.has('win32') == 1 then -- 0: false, 1: true
    setup_vimls_for_windows()
    setup_sumneko_lua_for_windows()
  else
    setup_sumneko_lua()
  end
end

local function setup_servers()
  local servers = require'lspinstall'.installed_servers()

  pre_setup()

  require'lspinstall'.setup()

  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end
