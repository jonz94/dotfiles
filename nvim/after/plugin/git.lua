if vim.g.vscode then
  -- stylua: ignore start
  vim.keymap.set('n', '<Leader>gg',        '<Cmd>call VSCodeNotify("git-graph.view")<CR>')
  vim.keymap.set('n', '<Leader><Leader>g', '<Cmd>call VSCodeNotify("workbench.view.scm")<CR>')
  -- stylua: ignore end

  return
end

local neogit_status_ok, neogit = pcall(require, 'neogit')
if not neogit_status_ok then
  return
end

neogit.setup({
  disable_context_highlighting = true,
  signs = {
    -- { CLOSED, OPENED }
    section = { '', '' },
    item = { '', '' },
    hunk = { '', '' },
  },
})

vim.keymap.set('n', '<Leader>gg', '<Cmd>Flog<CR>')

vim.keymap.set('n', '<Leader><Leader>g', function()
  neogit.open()
end)
