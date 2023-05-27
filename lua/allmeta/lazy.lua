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


require("lazy").setup("allmeta.plugins", {
  defaults = {
    lazy = true
  },
  install = {
    colorscheme = { "tokyonight-night", "habamax" },
  },
  performance = {
    rtp = {
      disabled_plugins = { "editorconfig", "health", "matchit", "netrw", "netrwPlugin", "rplugin", "spellfile", "tohtml", "zipPlugin", "gzip", "man", "matchparen", "nvim", "shada", "tarPlugin", "tutor", },
    },
  },
})
