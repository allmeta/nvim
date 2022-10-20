return {
  { 'wbthomason/packer.nvim' },
  { 'lewis6991/impatient.nvim' },

  { 'folke/tokyonight.nvim' },

  {
    'folke/which-key.nvim',
    config = function() require 'which-key'.setup {} end
  },

  {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'telescope'.setup(require 'config.telescope')
    end,
  },

  {
    'windwp/nvim-autopairs',
    config = function() require "nvim-autopairs".setup {
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        check_ts = true,
        fast_wrap = {
          map = "<M-e>",
          chars = { "{", "[", "(", '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
          offset = 0,
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "PmenuSel",
          highlight_grey = "LineNr",
        },
      }
    end
  },

  {
    'kylechui/nvim-surround',
    config = function() require "nvim-surround".setup {} end
  },

  {
    'akinsho/toggleterm.nvim',
    config = function() require "toggleterm".setup {} end
  },

  {
    'numToStr/Comment.nvim',
    config = function() require 'Comment'.setup {} end
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v2.x",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    config = function() require "nvim-treesitter.configs".setup {
        auto_install = true,
      }
    end
  },

  { 'stevearc/dressing.nvim' },

  {
    'lewis6991/gitsigns.nvim',
    config = function() require 'gitsigns'.setup() end
  },

  {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  },

  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },

  {
    'hrsh7th/cmp-nvim-lsp',
    config = function() require 'plugins.cmp' end,
  },

  {
    'williamboman/mason.nvim',
    config = function() require 'mason'.setup() end
  },

  {
    'williamboman/mason-lspconfig.nvim',
    config = function() require 'mason-lspconfig'.setup {
        automatic_installation = true,
      }
    end
  },

  {
    'neovim/nvim-lspconfig',
    config = function() require 'plugins.lsp' end,
  },
  {
    'glepnir/galaxyline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function () require'config.statusline' end,
  }
}
