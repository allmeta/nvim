return {
  {'wbthomason/packer.nvim'},

  {'lewis6991/impatient.nvim'},

  {'folke/tokyonight.nvim'},

  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {}
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
  },

  {
    'windwp/nvim-autopairs',
    config = function() require"nvim-autopairs".setup {
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
    } end
  },

  {
    'kylechui/nvim-surround',
    config = function() require"nvim-surround".setup{} end
  },

  {
    'akinsho/toggleterm.nvim',
    config = function() require"toggleterm".setup{} end
  },

  {
    'numToStr/Comment.nvim',
    config = function() require'Comment'.setup{} end
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    requires = {
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    config = function () require"nvim-treesitter.configs".setup {
      auto_install = true,
    } end
  },

  { 'stevearc/dressing.nvim' },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  },
}
