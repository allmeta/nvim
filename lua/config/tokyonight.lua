-- Telescope NvChad theme
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
