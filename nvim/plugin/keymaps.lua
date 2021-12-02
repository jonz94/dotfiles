local api = vim.api

api.nvim_set_keymap('n', '<Leader>ln', '<Cmd>lua require("jonz94.line-number").toggle()<CR>', { noremap = true })
