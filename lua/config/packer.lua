local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd 'packadd packer.nvim'
  install = true
end

local present, packer = pcall(require, "packer")

if present then
  packer.init({ display = { open_fn = require "packer.util".float } })

  local plugins = require "config.plugins"

  packer.startup(function(use)
    for _, plugin in pairs(plugins) do
      use(plugin)
    end
    if install then
      packer.sync()
    end
  end)
end
