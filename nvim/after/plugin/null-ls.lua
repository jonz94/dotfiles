if vim.g.vscode then
  return
end

local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint,

    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.stylua,
  },
})

-- stylua: ignore start
vim.keymap.set('n', '<Leader>fm', function() vim.lsp.buf.format({ timeout_ms = 10000 }) end)
