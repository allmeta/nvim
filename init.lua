-- statusline
-- lsp
-- dashboard?
-- whichkey labels
-- diagnostics underline
-- diagnostics icons
-- smooth fresh install
-- autoconfig installed lsp servers

pcall(require, 'impatient')

require 'config.options'
require 'config.keybinds'
require 'config.packer'
require 'config.lsp'
require 'config.cmp'

vim.cmd 'colorscheme tokyonight-night'
require 'config.telescope'
