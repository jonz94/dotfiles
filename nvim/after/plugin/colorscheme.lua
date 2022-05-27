if vim.g.vscode then
  return
end

if not pcall(require, 'onedarkpro') then
  return
end

local onedarkpro = require('onedarkpro')
local colors = require('jonz94.colors')
local is_windows = vim.fn.has('win32') == 1

onedarkpro.setup({
  colors = {
    onedark = {
      bg = colors.bg,
      black = colors.black,
      -- additional colors
      cursorline = colors.cursorline,
      selection = colors.selection,
      color_column = colors.color_column,
      indentline = colors.indentline,
      menu = colors.menu,
      menu_scroll = colors.menu_scroll,
    },
  },
  styles = {
    strings = 'NONE',
    comments = 'italic',
    keywords = 'bold',
    functions = 'NONE',
    variables = 'NONE',
    virtual_text = 'NONE',
  },
  options = {
    bold = true,
    italic = true,
    underline = false,
    undercurl = false, -- curly underline
    cursorline = true,
  },
  plugins = {
    telescope = false,
  },
  hlgroups = {
    -- 'nbsp', 'space', 'tab' and 'trail' in 'listchars'
    Whitespace = { fg = colors.cursorline },

    -- current line number
    CursorLineNr = { bg = colors.cursorline, fg = colors.yellow, style = 'bold' },

    -- the character under the cursor or just before it,
    -- if it is a paired bracket, and its match. |pi_paren.txt|
    MatchParen = { fg = colors.none, bg = colors.gray },

    -- remove italic style on operator
    Operator = { style = 'NONE' },

    -- operators that are English words, e.g. `and`, `as`, `or`
    TSKeywordOperator = { fg = colors.purple },

    -- html tag attributes.
    TSTagAttribute = { fg = colors.orange },

    TSConstructor = { fg = colors.yellow },

    TSTypeBuiltin = { fg = colors.yellow },

    TSLabel = { fg = colors.red, style = 'NONE' },

    TSInclude = { fg = colors.purple },

    -- telescope
    TelescopeSelection = { bg = colors.cursorline, fg = colors.yellow },
    TelescopeSelectionCaret = { fg = colors.yellow },
    TelescopeMultiSelection = { bg = colors.cursorline, fg = colors.comment },
    TelescopeNormal = { fg = colors.fg },
    TelescopeBorder = { fg = colors.comment },
    TelescopePromptBorder = { link = 'TelescopeBorder' },
    TelescopePreviewBorder = { link = 'TelescopeBorder' },
    TelescopeMatching = { fg = colors.green, style = 'italic' },
    TelescopePromptPrefix = { line = 'TelescopeNormal' },
    TelescopePrompt = { link = 'TelescopeNormal' },

    -- nvim-tree inactive
    NvimTreeNormalNC = { bg = colors.bg },

    -- nvim-tree
    NvimTreeFolderName = { fg = colors.fg },
    NvimTreeFolderIcon = { fg = colors.yellow },
    NvimTreeOpenedFolderName = { fg = colors.fg },
    NvimTreeMarkdownFile = { fg = colors.fg },
    NvimTreeExecFile = {
      fg = is_windows and colors.fg or colors.green,
      style = is_windows and 'NONE' or 'bold',
    },
    NvimTreeOpenedFile = { fg = colors.yellow, style = 'italic' },

    -- virtual color column
    VirtColumn = { fg = colors.cursorline, bg = colors.bg },
  },
})

onedarkpro.load()
