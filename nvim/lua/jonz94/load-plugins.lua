local packer = require('packer')
local plugins = require('jonz94.plugins')

local is_win = vim.fn.has('win32')

-- initialize packer settings
packer.init({
  maxjobs = is_win and 10 or nil,
  display = {
    working_sym = ' ',
    error_sym = ' ',
    done_sym = ' ',
    removed_sym = ' ',
    moved_sym = ' ',
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

-- start loading plugins
packer.startup(plugins)

-- automatically run `:PackerCompile` whenever `plugins.lua` is updated
vim.cmd([[
  augroup PackerUserConfig
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup END
]])
