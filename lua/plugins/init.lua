return {
  { 'wbthomason/packer.nvim' },
  { 'lewis6991/impatient.nvim' },

  {
    'folke/tokyonight.nvim',
    config = function()
      local ok, c = pcall(require, 'tokyonight.colors')
      if not ok then return end

      local colors = c.setup()

      colors.bg_alt = colors.bg_dark
      colors.bg = colors.bg_highlight

      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.bg_alt, bg = colors.bg_alt })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.bg, bg = colors.bg })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = colors.fg, bg = colors.bg })
      vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = colors.red, bg = colors.bg })
      vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = colors.bg_alt, bg = colors.green })
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = colors.bg_alt, bg = colors.red })
      vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = colors.bg_alt, bg = colors.bg_alt })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.bg_alt, bg = colors.bg_alt })
      vim.api.nvim_set_hl(0, "LvimInfoHeader", { fg = colors.bg_alt, bg = colors.green })
      vim.api.nvim_set_hl(0, "LvimInfoIdentifier", { fg = colors.red, bg = colors.bg_alt })
      vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = colors.bg })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = colors.bg_alt })
    end
  },

  {
    'folke/which-key.nvim',
    config = function()
      local wk = require"which-key"
      wk.setup {}
      wk.register({
        ["<leader>f"] = { name = "+file" },
        ["<leader>p"] = { name = "+packer" },
        ["<leader>l"] = { name = "+lsp" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>t"] = { name = "+terminal" },
      })
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require 'telescope'.setup(require 'config.telescope')
    end,
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require "nvim-autopairs".setup {
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
    config = function()
      require 'neo-tree'.setup {
        close_if_last_window = true,
        follow_current_file = true,
        filesystem = {
          follow_current_file = true,
          hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true,
        },
        window = {
          width = 30,
        },
      }
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    config = function() require "nvim-treesitter.configs".setup {
        ensure_installed = {"c","java", "kotlin", "haskell", "lua"},
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
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
    config = function() require 'config.statusline' end,
  },
  {
    'j-hui/fidget.nvim',
    config = function() require 'fidget'.setup() end,
  },
  {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function() require 'bufferline'.setup() end,
  }
}
