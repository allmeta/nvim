return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "meuter/lualine-so-fancy.nvim",
  },
  event = "VeryLazy",
  config = function()
    local function show_macro_recording()
      local recording_register = vim.fn.reg_recording()
      if recording_register == "" then return "" else return "Recording @" .. recording_register end
    end

    require 'lualine'.setup {
      options = {
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {},
        lualine_b = {
          {
            'filename',
            path = 1
          }
        },
        lualine_c = { 'branch', 'diff', 'diagnostics', { 'macro', fmt = show_macro_recording } },
        lualine_x = { 'searchcount', { 'fancy_lsp_servers', } },
        lualine_y = { 'progress', 'location' },
        lualine_z = {}
      },
    }

    vim.api.nvim_create_autocmd("RecordingEnter",
      { callback = function() require 'lualine'.refresh({ place = { "statusline" }, }) end, })
    vim.api.nvim_create_autocmd("RecordingLeave", {
      callback = function()
        -- This is going to seem really weird!
        -- Instead of just calling refresh we need to wait a moment because of the nature of
        -- vim.fn.reg_recording. If we tell lualine to refresh right now it actually will
        -- still show a recording occuring because vim.fn.reg_recording hasn't emptied yet.
        -- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
        -- ensure vim.fn.reg_recording is purged before asking lualine to refresh.
        local timer = vim.loop.new_timer()
        timer:start(50, 0, vim.schedule_wrap(function() require 'lualine'.refresh({ place = { "statusline" }, }) end))
      end,
    })
  end

}
