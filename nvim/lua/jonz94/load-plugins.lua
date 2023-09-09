local packer = require('packer')
local plugins = require('jonz94.plugins')

local is_windows = vim.fn.has('win32') == 1

-- initialize packer settings
packer.init({
  maxjobs = is_windows and 10 or nil,
  display = {
    working_sym = '󰝥 ',
    error_sym = '󰅙 ',
    done_sym = '󰄳 ',
    removed_sym = ' ',
    moved_sym = '󰳟 ',
    open_fn = function()
      return require('packer.util').float({ border = 'none' })
    end,
  },
})

-- start loading plugins
packer.startup(plugins)

-- automatically run `:PackerCompile` whenever `plugins.lua` is updated
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
  group = vim.api.nvim_create_augroup('PackerUserConfig', { clear = true }),
  desc = 'automatically run `:PackerCompile` whenever `plugins.lua` is updated',
})
