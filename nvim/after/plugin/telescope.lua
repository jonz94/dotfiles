if vim.g.vscode then
  return
end

if not pcall(require, 'telescope') then
  return
end

local telescope = require('telescope')
local builtin = require('telescope.builtin')
local nnoremap = vim.keymap.nnoremap
local is_win = vim.fn.has('win32')

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
        width = 0.9
      },
    },
  },
})

if not is_win then
  if not pcall(require, 'telescope-fzf-native') then
    telescope.load_extension('fzf')
  end
end

nnoremap({ '<C-p>',      function() builtin.find_files()   end })
nnoremap({ '<Leader>fd', function() builtin.find_files()   end })
nnoremap({ '<Leader>fg', function() builtin.live_grep()    end })
nnoremap({ '<Leader>ls', function() builtin.buffers()      end })
nnoremap({ '<Leader>fh', function() builtin.help_tags()    end })
nnoremap({ '<Leader>he', function() builtin.help_tags()    end })
nnoremap({ '<Leader>fb', function() builtin.file_browser() end })
nnoremap({ '<Leader>gb', function() builtin.git_branches() end })
nnoremap({ '<Leader>gc', function() builtin.git_commits()  end })
nnoremap({ '<Leader>gs', function() builtin.git_status()   end })

vim.api.nvim_set_keymap('n', '<Leader>fi', ':Telescope ', { noremap = true })
