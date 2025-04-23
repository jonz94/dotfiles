if vim.g.vscode then
  return
end

local group = vim.api.nvim_create_augroup('DisableMatchParenInInsertMode', { clear = true })

vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    vim.opt.matchpairs = {}
    vim.cmd('NoMatchParen')
  end,
  group = group,
  desc = 'disable match paren when entering insert mode',
})

vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    vim.opt.matchpairs = { '(:)', '{:}', '[:]' }
    vim.cmd('DoMatchParen')
  end,
  group = group,
  desc = 're-enable match paren when leaving insert mode',
})
