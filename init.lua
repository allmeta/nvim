-- statusline
-- lsp
-- dashboard?
-- whichkey labels
pcall(require, 'impatient')

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'

  use 'folke/tokyonight.nvim'
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {}
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require"nvim-autopairs".setup{} end
  }
  use {
    'kylechui/nvim-surround',
    config = function() require"nvim-surround".setup{} end
  }
  use {
    'akinsho/toggleterm.nvim',
    config = function() require"toggleterm".setup{} end
  }
  use {
    'numToStr/Comment.nvim',
    config = function() require'Comment'.setup{} end
  }
  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = {
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require'nvim-treesitter.install'.update({ with_sync = true }) end,
    config = function () require"nvim-treesitter.configs".setup {
      auto_install = true,
    } end
  }
  use {
    "rebelot/heirline.nvim"
  }
  use {
    'stevearc/dressing.nvim'
  }

  if install_plugins then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = require"packer.util".float,
  }
}})


if install_plugins then
  return
end

opt = {
  backspace = vim.opt.backspace + { "nostop" }, -- Don't stop backspace at insert
  clipboard = "", -- Connection to the system clipboard
  cmdheight = 0, -- hide command line unless needed
  completeopt = { "menuone", "noselect" }, -- Options for insert mode completion
  copyindent = true, -- Copy the previous indentation on autoindenting
  cursorline = true, -- Highlight the text line of the cursor
  expandtab = true, -- Enable the use of space in tab
  fileencoding = "utf-8", -- File content encoding for the buffer
  fillchars = { eob = " " }, -- Disable `~` on nonexistent lines
  history = 100, -- Number of commands to remember in a history table
  ignorecase = true, -- Case insensitive searching
  laststatus = 3, -- globalstatus
  lazyredraw = true, -- lazily redraw screen
  mouse = "a", -- Enable mouse support
  number = true, -- Show numberline
  preserveindent = true, -- Preserve indent structure as much as possible
  pumheight = 10, -- Height of the pop up menu
  relativenumber = true, -- Show relative numberline
  scrolloff = 8, -- Number of lines to keep above and below the cursor
  shiftwidth = 2, -- Number of space inserted for indentation
  showmode = false, -- Disable showing modes in command line
  showtabline = 2, -- always display tabline
  sidescrolloff = 8, -- Number of columns to keep at the sides of the cursor
  signcolumn = "yes", -- Always show the sign column
  smartcase = true, -- Case sensitivie searching
  splitbelow = true, -- Splitting a new window below the current one
  splitright = true, -- Splitting a new window at the right of the current one
  swapfile = false, -- Disable use of swapfile for the buffer
  tabstop = 2, -- Number of space in a tab
  termguicolors = true, -- Enable 24-bit RGB color in the TUI
  timeoutlen = 300, -- Length of time to wait for a mapped sequence
  undofile = true, -- Enable persistent undo
  updatetime = 300, -- Length of time to wait before triggering the plugin
  wrap = true, -- Disable wrapping of lines longer than the width of window
  writebackup = false, -- Disable making a backup before overwriting a file
}

g = {
  highlighturl_enabled = true, -- highlight URLs by default
  mapleader = " ", -- set leader key
  zipPlugin = false, -- disable zip
  load_black = false, -- disable black
  loaded_2html_plugin = true, -- disable 2html
  loaded_getscript = true, -- disable getscript
  loaded_getscriptPlugin = true, -- disable getscript
  loaded_gzip = true, -- disable gzip
  loaded_logipat = true, -- disable logipat
  loaded_matchit = true, -- disable matchit
  loaded_netrwFileHandlers = true, -- disable netrw
  loaded_netrwPlugin = true, -- disable netrw
  loaded_netrwSettngs = true, -- disable netrw
  loaded_remote_plugins = true, -- disable remote plugins
  loaded_tar = true, -- disable tar
  loaded_tarPlugin = true, -- disable tar
  loaded_zip = true, -- disable zip
  loaded_zipPlugin = true, -- disable zip
  loaded_vimball = true, -- disable vimball
  loaded_vimballPlugin = true, -- disable vimball
  cmp_enabled = true, -- enable completion at start
  autopairs_enabled = true, -- enable autopairs at start
  diagnostics_enabled = true, -- enable diagnostics at start
  status_diagnostics_enabled = true, -- enable diagnostics in statusline
}

keybinds={
  i={
  },
  n={
    -- Telescope
    ["<leader>ff"] = "<cmd>Telescope find_files<cr>",
    ["<leader>fo"] = "<cmd>Telescope oldfiles<cr>",
    ["<leader>fw"] = "<cmd>Telescope live_grep<cr>",
    ["<leader>fb"] = "<cmd>Telescope buffers<cr>",
    -- ToggleTerm
    ["<leader>th"] = "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
    ["<C-;>"] = "<cmd>ToggleTerm<cr>",
    -- Packer
    ["<leader>pc"] = "<cmd>PackerCompile<cr>", 
    ["<leader>ps"] = "<cmd>PackerSync<cr>", 
    ["<leader>pS"] = "<cmd>PackerStatus<cr>", 
    ["<leader>pu"] = "<cmd>PackerUpdate<cr>",
    -- Comment
    ["<leader>/"] = function() require("Comment.api").toggle.linewise.current() end,
    ["<C-/>"] = function() require("Comment.api").toggle.linewise.current() end,
    -- NeoTree
    ["<C-n>"] = "<cmd>Neotree toggle<cr>",
    -- Rebinds
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<C-l>"] = "<C-w>l",
    ["<C-h>"] = "<C-w>h",
    ["<leader>r"] = "<cmd>source $MYVIMRC<cr>",

  },
  t={
    ["<C-j>"] = "<C-\\><C-n><C-w>j",
    ["<C-k>"] = "<C-\\><C-n><C-w>k",
    ["<C-h>"] = "<C-\\><C-n><C-w>h",
    ["<C-l>"] = "<C-\\><C-n><C-w>l",
    ["<Esc>"] = "<C-\\><C-n>",
    ["<C-;>"] = "<cmd>ToggleTerm<cr>",
    -- NeoTree
    ["<C-n>"] = "<cmd>Neotree toggle<cr>",
  },
  v={
    -- Comment
    ["<leader>/"] = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    ["<C-/>"] = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  },
}

for k,v in pairs(opt) do
  vim.opt[k]=v
end

for k,v in pairs(g) do
  vim.g[k]=v
end

for mode, binds in pairs(keybinds) do
  for bind, cmd in pairs(binds) do
    vim.keymap.set(mode, bind, cmd, {})
  end
end

vim.cmd('colorscheme tokyonight-night')

-- Telescope theme
require"telescope".setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "normal",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
  pickers = {}
}

local colors = require"tokyonight.colors".setup()
colors.bg_alt = colors.bg_dark
colors.bg = colors.bg_highlight

vim.api.nvim_set_hl(0, "TelescopeBorder", {fg=colors.bg_alt, bg=colors.bg_alt})
vim.api.nvim_set_hl(0, "TelescopePromptBorder", {fg=colors.bg , bg=colors.bg})
vim.api.nvim_set_hl(0, "TelescopePromptNormal", {fg=colors.fg , bg=colors.bg})
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {fg=colors.red , bg=colors.bg})
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {fg=colors.bg_alt , bg=colors.green})
vim.api.nvim_set_hl(0, "TelescopePromptTitle", {fg=colors.bg_alt , bg=colors.red})
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {fg=colors.bg_alt , bg=colors.bg_alt})
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {fg=colors.bg_alt , bg=colors.bg_alt})
vim.api.nvim_set_hl(0, "LvimInfoHeader", {fg=colors.bg_alt , bg=colors.green})
vim.api.nvim_set_hl(0, "LvimInfoIdentifier", {fg=colors.red , bg=colors.bg_alt})
vim.api.nvim_set_hl(0, "TelescopeSelection", {bg=colors.bg})
vim.api.nvim_set_hl(0, "TelescopeNormal", {bg=colors.bg_alt})

-- heirline
local heirline = require"heirline"
heirline.load_colors(colors)

-- mode file git git-diff     LSP line %
