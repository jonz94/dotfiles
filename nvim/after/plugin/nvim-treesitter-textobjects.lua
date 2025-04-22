if not pcall(require, 'nvim-treesitter') then
  return
end

if not pcall(require, 'nvim-treesitter-textobjects') then
  return
end

require('nvim-treesitter.configs').setup({
  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',

        -- custom textobjects treesitter queries
        ['at'] = '@tag.outer',
        ['it'] = '@tag.inner',
      },
      selection_modes = {
        ['@function.outer'] = 'V',
        ['@class.outer'] = 'V',
      },
    },
  },
})
