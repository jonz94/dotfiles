local plugins = function(use)
  local is_windows = vim.fn.has('win32') == 1

  -- package manager
  use({ 'wbthomason/packer.nvim' })

  -- improve neovim speed
  use({ 'lewis6991/impatient.nvim' })

  -- neovim's lua functions library
  use({ 'nvim-lua/plenary.nvim' })

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
  use({
    'RRethy/nvim-treesitter-endwise',
    requires = 'nvim-treesitter/nvim-treesitter',
  })

  -- lsp
  use({ 'neovim/nvim-lspconfig' })
  use({ 'williamboman/nvim-lsp-installer' })
  use({ 'folke/lua-dev.nvim' })
  use({ 'onsails/lspkind-nvim' })
  use({
    'zbirenbaum/neodim',
    event = 'LspAttach',
  })
  use({ 'jose-elias-alvarez/null-ls.nvim' })
  use({ 'j-hui/fidget.nvim' })

  -- renamer
  use({
    'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = 'nvim-lua/plenary.nvim',
  })

  -- telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
  })
  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    disable = is_windows,
    requires = 'nvim-telescope/telescope.nvim',
    run = 'make',
  })
  use({
    'nvim-telescope/telescope-file-browser.nvim',
    requires = 'nvim-telescope/telescope.nvim',
  })

  -- navigation
  use({
    'christoomey/vim-tmux-navigator',
    setup = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
  })

  -- enhance navigation and highlighting of matching words
  use({ 'andymass/vim-matchup' })

  -- automatically change the current working directory
  use({ 'ahmedkhalf/project.nvim' })

  -- file explorer
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  })

  -- icons
  use({ 'kyazdani42/nvim-web-devicons' })

  -- indentation guide line
  use({ 'lukas-reineke/indent-blankline.nvim' })

  -- virtual text color column
  use({
    'lukas-reineke/virt-column.nvim',
    config = function()
      require('virt-column').setup({ virtcolumn = '81,121' })
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

  -- git graph
  use({
    'rbong/vim-flog',
    requires = { 'tpope/vim-fugitive' },
  })

  -- git signs
  use({
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
  })

  -- comments
  use({ 'numToStr/Comment.nvim' })

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
  use({ 'johmsalas/text-case.nvim' })

  -- extended increment/decrement plugin
  use({ 'monaqa/dial.nvim' })

  -- auto rename tag
  use({
    'AndrewRadev/tagalong.vim',
    setup = function()
      vim.g.tagalong_mappings = { 'c', 'C', 's', 'v', 'i', 'a', 'A' }
    end,
  })

  -- line maniuplation
  use({ 'matze/vim-move' })

  -- terminal
  use({
    'akinsho/toggleterm.nvim',
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

      local group = vim.api.nvim_create_augroup('ToggleTerminal', { clear = true })
      vim.api.nvim_create_autocmd('TermOpen', {
        pattern = 'term://*',
        callback = function()
          vim.opt.cursorline = false
        end,
        group = group,
        desc = 'turn off cursorline when starting a terminal',
      })
      vim.api.nvim_create_autocmd('TermOpen', {
        pattern = 'term://*',
        callback = function()
          vim.opt.signcolumn = 'no'
        end,
        group = group,
        desc = 'turn off sign column when starting a terminal',
      })
      vim.api.nvim_create_autocmd('TermOpen', {
        pattern = 'term://*',
        callback = function()
          vim.opt.colorcolumn = {}
          require('jonz94.virt-column-helper').disable_buffer()
        end,
        group = group,
        desc = 'turn off virtual text color column when starting a terminal',
      })
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

  -- highlight arguments' definitions and usages
  use({
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
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
    'jonz94/vim-xkbswitch',
    disable = not is_windows,
    setup = function()
      vim.g.XkbSwitchEnabled = 1
      vim.g.XkbSwitchLib = vim.env.HOME .. '\\xkb-switch-win\\bin\\libxkbswitch64.dll'
    end,
  })

  -- automatically creates missing directories on saving a file
  use({
    'jghauser/mkdir.nvim',
  })
end

return plugins
