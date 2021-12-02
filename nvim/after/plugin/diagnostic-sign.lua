if vim.g.vscode then
  return
end

-- change neovim's diagnostic signs
-- credits: https://github.com/folke/trouble.nvim/issues/52

local icons = require('jonz94.icons')

local signs = {
  -- for neovim 0.6+
  DiagnosticSignError = icons.error,
  DiagnosticSignHint = icons.hint,
  DiagnosticSignInfo = icons.info,
  DiagnosticSignWarn = icons.warn,
  -- for neovim 0.5
  LspDiagnosticsSignError = icons.error,
  LspDiagnosticsSignHint = icons.hint,
  LspDiagnosticsSignInformation = icons.info,
  LspDiagnosticsSignWarning = icons.warn,
}

for hl, icon in pairs(signs) do
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
