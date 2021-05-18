-- ignore this file if neovim is running inside vscode
if vim.fn.exists('g:vscode') == 1 then -- 0: false, 1: true
  return
end

local gl = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = { 'NvimTree', 'vista', 'dbui', 'packer' }

local l = 1
gls.left[l] = {
  RainbowLeft = {
    provider = function() return '▊ ' end,
    highlight = { colors.blue, colors.bg }
  },
}

l = l + 1
gls.left[l] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.red,
        i = colors.green,
        v = colors.blue,
        [''] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce=colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!']  = colors.red,
        t = colors.red,
      }
      vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
      return '  '
    end,
  },
}

l = l + 1
gls.left[l] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    highlight = { colors.violet, colors.bg, 'bold' },
  },
}

l = l + 1
gls.left[l] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = { colors.violet, colors.bg, 'bold' },
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

l = l + 1
gls.left[l] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.green, colors.bg },
  },
}

l = l + 1
gls.left[l] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.orange, colors.bg },
  },
}

l = l + 1
gls.left[l] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.red, colors.bg },
  },
}

local m = 1
gls.mid[m] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg },
  },
}

m = m + 1
gls.mid[m] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, 'bold' },
  },
}

local r = 1
r = r + 1
gls.right[r] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = { colors.red, colors.bg }
  },
}

r = r + 1
gls.right[r] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = { colors.yellow, colors.bg },
  },
}

r = r + 1
gls.right[r] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = { colors.cyan, colors.bg },
  },
}

r = r + 1
gls.right[r] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = { colors.blue, colors.bg },
  },
}

r = r + 1
gls.right[r] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true, [''] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = '  LSP:',
    highlight = { colors.yellow, colors.bg, 'bold' },
  },
}

r = r + 1
gls.right[r] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    highlight = { colors.green, colors.bg, 'bold' },
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

r = r + 1
gls.right[r] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    highlight = { colors.blue, colors.bg, 'bold' },
    separator = '  ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

r = r + 1
gls.right[r] = {
  PerCent = {
    provider = function ()
      local current_line = vim.fn.line('.')
      local total_line = vim.fn.line('$')
      if current_line == 1 then
        return ' Top '
      elseif current_line == vim.fn.line('$') then
        return ' End '
      end
      local result,_ = math.modf((current_line/total_line)*100)
      return ' '.. result .. '% '
    end,
    highlight = { colors.fg, colors.bg, 'bold' },
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

r = r + 1
gls.right[r] = {
  RainbowRight = {
    provider = function() return '  ▊' end,
    highlight = {colors.blue,colors.bg}
  },
}

local sl = 1
gls.short_line_left[sl] = {
  BufferType = {
    provider = 'FileTypeName',
    highlight = { colors.blue, colors.bg, 'bold' },
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
  },
}

sl = sl + 1
gls.short_line_left[sl] = {
  SFileName = {
    provider = 'SFileName',
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, 'bold' },
  },
}

local sr = 1
gls.short_line_right[sr] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = { colors.fg, colors.bg },
  },
}

-- overwrite status line highlight provided by onedark.vim
vim.api.nvim_command('highlight StatusLine ctermbg=Gray ctermfg=LightGray guibg=#202328 guifg=#bbc2cf')
