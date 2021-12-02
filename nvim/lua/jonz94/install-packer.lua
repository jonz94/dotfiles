if vim.fn.input('Download Packer? (y for yes) ') ~= 'y' then
  return
end

local directory = string.format('%s/site/pack/packer/start/', vim.fn.stdpath('data'))

vim.fn.mkdir(directory, 'p')

local out = vim.fn.system(
  string.format('git clone %s %s', 'https://github.com/wbthomason/packer.nvim', directory .. '/packer.nvim')
)

print(out)
print('Downloaded packer.nvim')

vim.cmd('packadd packer.nvim')

require('jonz94.load-plugins')

-- change float terminal highlight color
vim.cmd([[
  hi NormalFloat ctermbg=233 ctermfg=253 guibg=#282c34 guifg=#dcdfe4
  hi FloatBorder ctermbg=233 ctermfg=233 guibg=#282c34 guifg=#282c34
]])

require('packer').sync()

print('After finishing plugins installtion, you may consider to re-open neovim!')
