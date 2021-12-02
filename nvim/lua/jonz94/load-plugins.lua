local packer = require('packer')
local plugins = require('jonz94.plugins')

-- initialize packer settings
packer.init({
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
