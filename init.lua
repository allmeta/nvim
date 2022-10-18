-- statusline
-- whichkey labels
pcall(require, 'impatient')

require 'config.options'
require 'config.keybinds'
require 'config.packer'

local ok,_ = pcall(vim.cmd, 'colorscheme tokyonight-night')
if not ok then
  vim.cmd 'colorscheme habamax'
end

require 'config.tokyonight'
