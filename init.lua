-- statusline
-- diagnostics icons
-- smooth fresh install

pcall(require, 'impatient')

require 'config.options'
require 'config.keybinds'
require 'config.packer'
require 'config.lsp'
require 'config.cmp'

vim.cmd 'colorscheme tokyonight-night'
require 'config.telescope'
