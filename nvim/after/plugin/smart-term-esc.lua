if vim.g.vscode then
  return
end

if not pcall(require, 'smart-term-esc') then
  return
end

require('smart-term-esc').setup({
  key = '<Esc>',
  except = { 'nvim', 'fzf' },
})
