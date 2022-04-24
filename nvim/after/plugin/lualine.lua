if vim.g.vscode then
  return
end

if not pcall(require, 'lualine') then
  return
end

if not pcall(require, 'onedarkpro') then
  return
end

local colors = require('jonz94.colors')
local icons = require('jonz94.icons')

local theme = {
  normal = {
    a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
    b = { fg = colors.fg, bg = '#3e4452' },
    c = { fg = colors.fg, bg = '#2c323d' },
  },
  visual = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
  replace = { a = { fg = colors.bg, bg = colors.red, gui = 'bold' } },
  insert = { a = { fg = colors.bg, bg = colors.blue, gui = 'bold' } },
  command = { a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' } },
  inactive = {
    a = { fg = colors.gray, bg = colors.bg, gui = 'bold' },
    b = { fg = colors.gray, bg = colors.bg },
    c = { fg = colors.gray, bg = colors.bg },
  },
}

require('lualine').setup({
  options = {
    theme = theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' } },
    },
    lualine_b = {
      { 'filename' },
    },
    lualine_c = {
      { 'filetype' },
      { 'fileformat' },
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = icons,
        padding = 2,
      },
    },
    lualine_y = {
      {
        'diff',
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.yellow },
          removed = { fg = colors.red },
        },
        symbols = {
          added = '+',
          modified = '~',
          removed = '-',
        },
      },
      { 'branch', icon = '' },
    },
    lualine_z = {
      { 'location', separator = { right = '' } },
    },
  },
  extensions = { 'nvim-tree' },
})
