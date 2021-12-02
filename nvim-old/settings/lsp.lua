-- ignore this file if neovim is running inside vscode
if vim.fn.exists('g:vscode') == 1 then -- 0: false, 1: true
  return
end

require'nvim-lsp-installer'.on_server_ready(function (server) server:setup {} end)
