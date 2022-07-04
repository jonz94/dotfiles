if vim.g.vscode then
  return
end

local package_info_status_ok, package_info = pcall(require, 'package-info')
if not package_info_status_ok then
  return
end

package_info.setup()
