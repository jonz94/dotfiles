if vim.g.vscode then
  return
end

local smart_term_esc_status_ok, smart_term_esc = pcall(require, 'smart-term-esc')
if not smart_term_esc_status_ok then
  return
end

smart_term_esc.setup({
  key = '<Esc>',
  except = { 'nvim', 'fzf' },
})
