local opt = vim.opt

-- enable true color
opt.termguicolors = true

-- don't show the intro message when starting neovim
opt.shortmess:append('I')

-- hide built-in display current mode feature
-- since we have status line plugins to do that
opt.showmode = false

-- show last command on screen
opt.showcmd = true

-- makes search act like search in modern browsers
opt.incsearch = true

-- show matching brackets when text indicator is over them
opt.showmatch = true

-- show line numbers
opt.relativenumber = true

-- but show the actual number for the line we're on
opt.number = true

-- always show sign column
opt.signcolumn = 'yes'

-- ignore case when searching...
opt.ignorecase = true

-- ... unless there is a capital letter in the query
opt.smartcase = true

-- highlight the current line
opt.cursorline = true

-- i don't like my windows changing all the time
opt.equalalways = false

-- prefer windows splitting to the right
opt.splitright = true

-- prefer windows splitting to the bottom
opt.splitbelow = true

-- make updates happen faster
opt.updatetime = 1000

-- i wouldn't use this without my DoNoHL function
opt.hlsearch = true

-- make it so there are always ten lines below my cursor
opt.scrolloff = 10

-- tweak file matching options
opt.path = '.,**'

-- indentation settings
opt.autoindent = true
opt.cindent = true
opt.wrap = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

-- line wrap
opt.breakindent = true
opt.showbreak = string.rep(' ', 3) -- make long lines wrap smartly
opt.linebreak = true

-- show whitespace characters
opt.list = true
opt.listchars = {
  tab = '<->',
  -- space = '⋅',
  nbsp = '.',
  trail = '⋅',
  extends = '❯',
  precedes = '❮',
}

-- hide `EndOfBuffer character`, a.k.a. `~`
opt.fillchars = {
  eob = ' ',
}

-- turn off the bell
opt.belloff = 'all'

-- enable all mouse feature
-- tips: to temporarily disable mouse support,
--       hold the shift key while using the mouse.
-- credits: :help 'mouse'
opt.mouse = 'a'
