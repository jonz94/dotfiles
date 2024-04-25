if vim.g.vscode then
  return
end

local fidget_status_ok, fidget = pcall(require, 'fidget')
if not fidget_status_ok then
  return
end

fidget.setup({
  progress = {
    display = {
      done_icon = ' ',
      progress_icon = {
        pattern = 'earth',
      },
    },
  },
})
