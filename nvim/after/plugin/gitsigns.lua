if vim.g.vscode then
  return
end

if not pcall(require, 'gitsigns') then
  return
end

require('gitsigns').setup({
  signs = {
    add = {
      hl = 'GitSignsAdd',
      text = '▌',
      numhl = 'GitSignsAddNr',
      linehl = 'GitSignsAddLn',
    },
    change = {
      hl = 'GitSignsChange',
      text = '▌',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
  },
})
