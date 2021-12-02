if vim.g.vscode then
  return
end

if not pcall(require, 'package-info') then
  return
end

require('package-info').setup()
