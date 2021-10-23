-- ignore this file if neovim is running inside vscode
if vim.fn.exists('g:vscode') == 1 then -- 0: false, 1: true
  return
end

require('gitsigns').setup{
  signs = {
    add    = {hl = 'GitSignsAdd'   , text = '▌', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change = {hl = 'GitSignsChange', text = '▌', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
}
