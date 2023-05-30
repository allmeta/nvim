return {
  'nvim-telescope/telescope.nvim',
  cmd = "Telescope",
  version = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require 'telescope'.setup({
      defaults = {
        selection_caret = "  ",
        initial_mode = "normal",
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },
      pickers = {
        live_grep = {
          initial_mode = "insert",
        },
      },
    })
  end
}
