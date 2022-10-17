-- statusline
-- lsp
-- dashboard?
-- whichkey labels
pcall(require, 'impatient')

require'config.options'
require'config.keybinds'
require'config.packer'

vim.cmd('colorscheme tokyonight-night')
require "config.telescope"

-- mode file git git-diff     LSP line %

