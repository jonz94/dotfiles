local colors = require('onedarkpro').get_colors('onedark')
local lighten = require('onedarkpro.utils').lighten

colors.bg = '#282c34'
colors.black = colors.bg

-- additional colors
colors.cursorline   = lighten(colors.bg, 0.97)
colors.selection    = lighten(colors.bg, 0.8)
colors.color_column = lighten(colors.bg, 0.97)
colors.indentline   = lighten(colors.bg, 0.92)
colors.menu         = lighten(colors.bg, 0.85)
colors.menu_scroll  = lighten(colors.bg, 0.90)

return colors
