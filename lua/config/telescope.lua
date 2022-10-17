require "telescope".setup {
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
  pickers = {
    live_grep = {
      initial_mode = "insert",
    },
  }
}

local colors = require "tokyonight.colors".setup()
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
