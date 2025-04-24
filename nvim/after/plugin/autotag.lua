if not pcall(require, 'nvim-treesitter') then
  return
end

local nvim_autotag_status_ok, nvim_autotag = pcall(require, 'nvim-ts-autotag')
if not nvim_autotag_status_ok then
  return
end

nvim_autotag.setup()
