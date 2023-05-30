require("allmeta.options")
require("allmeta.keybinds")
require("allmeta.autocmds")
require("allmeta.lazy")

local ok, _ = pcall(vim.cmd, 'colorscheme tokyonight-night')
if not ok then
  vim.cmd 'colorscheme habamax'
end
