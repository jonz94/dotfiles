local plugins = function(use)
  local is_windows = vim.fn.has('win32') == 1

  -- package manager
  use({ 'wbthomason/packer.nvim' })

  -- improve neovim speed
  use({ 'lewis6991/impatient.nvim' })

  -- neovim's lua functions library
  use({ 'nvim-lua/plenary.nvim' })

  -- lua keymap DSL
  use({ 'tjdevries/astronauta.nvim' })

  -- editorconfig
  use({ 'editorconfig/editorconfig-vim' })

  -- fix CursorHold issue of neovim
  use({
    'antoinemadec/FixCursorHold.nvim',
    setup = function()
      vim.g.curshold_updatime = 1000
    end,
  })

  -- treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })
  use({
    'nvim-treesitter/playground',
    requires = 'nvim-treesitter/nvim-treesitter',
  })

  -- lsp
  use({ 'neovim/nvim-lspconfig' })
  use({ 'williamboman/nvim-lsp-installer' })
  use({ 'folke/lua-dev.nvim' })
  use({ 'onsails/lspkind-nvim' })

  -- telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  })
  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    disable = is_windows,
    run = 'make',
  })

  -- navigation
  use({ 'christoomey/vim-tmux-navigator' })

  -- automatically change the current working directory
  use({ 'ahmedkhalf/project.nvim' })

  -- file explorer
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    setup = function()
      vim.g.nvim_tree_icons = {
        default = '',
        symlink = '',
        git = {
          unstaged  = '',
          staged    = '✓',
          unmerged  = '',
          renamed   = '',
          untracked = '',
          ignored   = '',
        },
        folder = {
          default      = '',
          open         = '',
          empty        = '',
          empty_open   = '',
          symlink      = '',
          symlink_open = '',
        },
      }
    end,
  })

  -- icons
  use({ 'kyazdani42/nvim-web-devicons' })

  -- indentation guide line
  use({
    'lukas-reineke/indent-blankline.nvim',
    setup = function()
      -- workaround for strange ghost highlighting
      -- https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
      vim.opt.colorcolumn = '99999'
    end,
  })

  -- colorschemes
  use({ 'olimorris/onedarkpro.nvim' })

  -- zen mode
  use({ 'folke/zen-mode.nvim' })

  -- zen mode option
  use({ 'folke/twilight.nvim' })

  -- status line
  use({
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      -- requires onedarkpro's color for themeing
      'olimorris/onedarkpro.nvim',
    },
  })

  -- git integration
  use({ 'TimUntersberger/neogit' })

  -- git signs
  use({
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
  })

  -- comments
  use { 'numToStr/Comment.nvim' }

  -- highlight todo comments
  use({
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
  })

  -- intuitive auto pairs
  use({ 'windwp/nvim-autopairs' })

  -- snippets
  use({ 'rafamadriz/friendly-snippets' })
  use({
    'L3MON4D3/LuaSnip',
    wants = 'friendly-snippets',
  })

  -- completion
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'windwp/nvim-autopairs',
      'onsails/lspkind-nvim',
    },
  })

  -- text maniuplation
  use({ 'godlygeek/tabular' })
  use({ 'tpope/vim-repeat' })
  use({
    'tpope/vim-surround',
    setup = function()
      vim.g.surround_no_mappings = 1
    end,
  })

  -- line maniuplation
  use({ 'matze/vim-move' })


  -- terminal
  use({
    'akinsho/nvim-toggleterm.lua',
    keys = '<M-`>',
    config = function()
      require('toggleterm').setup({
        size = 10,
        hide_numbers = true,
        open_mapping = [[<M-`>]],
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 1,
        start_in_insert = true,
        persist_size = true,
        direction = 'horizontal',
      })

      vim.cmd([[
        augroup ToggleTerminal
          autocmd!
          autocmd TermOpen term://* set signcolumn=no
          autocmd TermOpen term://* set nocursorline
        augroup END
      ]])
    end,
  })

  -- smart escape for terminal
  use({ 'sychen52/smart-term-esc.nvim' })

  -- stay in last place
  use({ 'farmergreg/vim-lastplace' })

  -- smooth scrolling
  use({ 'karb94/neoscroll.nvim' })

  -- node package manager
  use({
    'vuki656/package-info.nvim',
    requires = 'MunifTanjim/nui.nvim',
  })

  -- highlight trailing whitespace
  use({
    'ntpeters/vim-better-whitespace',
    setup = function()
      vim.g.better_whitespace_filetypes_blacklist = {
        -- following is default
        'diff',
        'git',
        'gitcommit',
        'unite',
        'qf',
        'help',
        'markdown',
        'fugitive',
        -- disabled when using neogit
        'NeogitCommitMessage',
        'NeogitCommitView',
        'NeogitGitCommandHistory',
        'NeogitLogView',
        'NeogitNotification',
        'NeogitPopup',
        'NeogitStatus',
        'NeogitStatusNew',
      }

      -- ignore empty lines
      vim.g.better_whitespace_skip_empty_lines = 1
    end,
  })

  -- syntax highlighting for kitty.conf
  use({ 'fladson/vim-kitty' })

  -- markdown preview
  use({
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    run = 'cd app && yarn install',
    setup = function()
      vim.g.mkdp_port = '9487'
    end,
  })

  -- input method switcher
  use({
    'rlue/vim-barbaric',
    disable = is_windows,
  })
  use({
    'lyokha/vim-xkbswitch',
    disable = not is_windows,
    setup = function()
      vim.g.XkbSwitchEnabled = 1
      vim.g.XkbSwitchLib = vim.env.HOME .. '\\xkb-switch-win\\bin\\libxkbswitch64.dll'
    end
  })
end

return plugins
