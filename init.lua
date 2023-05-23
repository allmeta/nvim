local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("allmeta.options")
require("allmeta.keybinds")
require("lazy").setup("allmeta.plugins", {
  defaults = {
    lazy = true
  },
  install = {
    colorscheme = { "tokyonight-night", "habamax" },
  },
})

local ok, _ = pcall(vim.cmd, 'colorscheme tokyonight-night')
if not ok then
  vim.cmd 'colorscheme habamax'
end
