if vim.g.vscode then
  -- stylua: ignore start
  vim.keymap.set('n', '<Leader>fd', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>')
  vim.keymap.set('n', '<Leader>fg', '<Cmd>call VSCodeNotify("workbench.action.findInFiles")<CR>')
  vim.keymap.set('n', '<Leader>ls', '<Cmd>call VSCodeNotify("workbench.view.explorer")<CR>')
  -- stylua: ignore end

  return
end

local telescope_status_ok, telescope = pcall(require, 'telescope')
if not telescope_status_ok then
  return
end

local builtin = require('telescope.builtin')
local is_windows = vim.fn.has('win32') == 1

telescope.setup({
  defaults = {
    prompt_prefix = '🔭  ',
    selection_caret = '👉 ',
    entry_prefix = '   ',
    layout_config = {
      horizontal = {
        height = 0.9,
        preview_cutoff = 120,
        preview_width = 0.6,
        width = 0.9,
      },
    },
  },
})

if not is_windows then
  if pcall(require, 'telescope._extensions.fzf') then
    telescope.load_extension('fzf')
  end
end

if pcall(require, 'telescope._extensions.file_browser') then
  telescope.load_extension('file_browser')

  vim.keymap.set('n', '<Leader>fb', function()
    require('telescope').extensions.file_browser.file_browser()
  end)
end

-- stylua: ignore start
vim.keymap.set('n', '<C-p>',      function() builtin.find_files()   end)
vim.keymap.set('n', '<Leader>fd', function() builtin.find_files()   end)
vim.keymap.set('n', '<Leader>fg', function() builtin.live_grep()    end)
vim.keymap.set('n', '<Leader>ls', function() builtin.buffers()      end)
vim.keymap.set('n', '<Leader>fh', function() builtin.help_tags()    end)
vim.keymap.set('n', '<Leader>he', function() builtin.help_tags()    end)
vim.keymap.set('n', '<Leader>gb', function() builtin.git_branches() end)
vim.keymap.set('n', '<Leader>gc', function() builtin.git_commits()  end)
vim.keymap.set('n', '<Leader>gs', function() builtin.git_status()   end)

vim.keymap.set('n', '<Leader>fi', ':Telescope ')
