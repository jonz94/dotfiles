if not pcall(require, 'packer') then
  require('jonz94.install-packer')

  return
end

require('impatient')

-- setup globals
require('jonz94.globals')

-- turn off some of builtin plugins
require('jonz94.disable-builtin')

-- use `space` as leader key
vim.g.mapleader = ' '

-- force loading of astronauta first
vim.cmd([[runtime plugin/astronauta.vim]])

-- load plugins
require('jonz94.load-plugins')
