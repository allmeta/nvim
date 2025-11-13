local keybinds = {
  i = {},

  n = {
    -- Files
    ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", { desc = "Find files" } },
    ["<leader>fo"] = { "<cmd>Telescope oldfiles<cr>", { desc = "Old files" } },
    ["<leader>fw"] = { "<cmd>Telescope live_grep<cr>", { desc = "Grep" } },
    ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", { desc = "Buffers" } },
    -- ToggleTerm
    ["<C-`>"] = { "<cmd>ToggleTerm<cr>", { desc = "Terminal" } },
    -- Comment
    ["<leader>/"] = { function() require("Comment.api").toggle.linewise.current() end, { desc = "Comment" } },
    ["<C-/>"] = { function() require("Comment.api").toggle.linewise.current() end, { desc = "Comment" } },
    -- NeoTree
    ["<C-n>"] = { "<cmd>Neotree toggle reveal<cr>", {} },
    -- Lazy
    ["<leader>L"] = { "<cmd>Lazy<cr>", { desc = "Lazy" } },
    -- Git
    ["<leader>gc"] = { "<cmd>Telescope git_commits<cr>", { desc = "Git commits" } },
    ["<leader>gb"] = { "<cmd>Telescope git_branches<cr>", { desc = "Git branches" } },
    ["<leader>gs"] = { "<cmd>Telescope git_status<cr>", { desc = "Git status" } },
    -- Noice
    ["<leader>nl"] = { function() require("noice").cmd("last") end, { desc = "Noice Last Message" } },
    ["<leader>nh"] = { function() require("noice").cmd("history") end, { desc = "Noice History" } },
    ["<leader>na"] = { function() require("noice").cmd("all") end, { desc = "Noice All" } },
    ["<leader>nd"] = { function() require("noice").cmd("dismiss") end, { desc = "Dismiss All" } },
    -- LSP
    ["<leader>li"] = { "<cmd>LspInfo<cr>", { desc = "Lsp info" } },
    ["<leader>ll"] = { "<cmd>LspLog<cr>", { desc = "Lsp log" } },
    ["<leader>lI"] = { "<cmd>Mason<cr>", { desc = "Lsp install" } },
    -- Util
    ["<leader>sk"] = { "<cmd>Telescope keymaps<cr>", { desc = "Search keymaps" } },
    ["<leader>sc"] = { "<cmd>Telescope commands<cr>", { desc = "Search commands" } },
    -- Window
    ["<C-j>"] = { "<C-w>j", {} },
    ["<C-k>"] = { "<C-w>k", {} },
    ["<C-l>"] = { "<C-w>l", {} },
    ["<C-h>"] = { "<C-w>h", {} },
    ["<leader>w-"] = { "<C-w>s", { desc = "Split below" } },
    ["<leader>w|"] = { "<C-w>v", { desc = "Split right" } },
    ["<leader>-"] = { "<C-w>s", { desc = "Split below" } },
    ["<leader>|"] = { "<C-w>v", { desc = "Split right" } },
    -- Buffer
    ["<C-]>"] = { "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" } },
    ["<C-[>"] = { "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" } },
    ["<leader>bn"] = { "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" } },
    ["<leader>bp"] = { "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" } },
    ["<leader>bc"] = { "<cmd>bd<cr>", { desc = "Close buffer" } },
    ["<leader>bd"] = { "<cmd>bd<cr>", { desc = "Close buffer" } },
    -- Misc
    ["<leader><leader>"] = { "", {} },
    ["<esc>"] = { "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" } },
    ["<leader>c"] = { "<cmd>cd %:h<cr>", { desc = "cd" } },
    ["<leader>p"] = { '"+p', { desc = "Paste clipboard" } },
  },

  t = {
    ["<C-j>"] = { "<C-\\><C-n><C-w>j", {} },
    ["<C-k>"] = { "<C-\\><C-n><C-w>k", {} },
    ["<C-h>"] = { "<C-\\><C-n><C-w>h", {} },
    ["<C-l>"] = { "<C-\\><C-n><C-w>l", {} },
    ["<Esc>"] = { "<C-\\><C-n>", {} },
    ["<C-;>"] = { "<cmd>ToggleTerm<cr>", {} },
    -- NeoTree
    ["<C-n>"] = { "<cmd>Neotree toggle reveal<cr>", {} },
  },

  v = {
    -- Comment
    ["<leader>/"] = { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", {} },
    ["<C-/>"] = { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", {} },
    -- Rebinds
    ["<"] = { "<gv", {} },
    [">"] = { ">gv", {} },
    ["<leader>p"] = { '"+p', { desc = "Paste clipboard" } },
    ["<leader>y"] = { '"+y', { desc = "Yank clipboard" } },
  },
}

for mode, binds in pairs(keybinds) do
  for bind, cmd in pairs(binds) do
    vim.keymap.set(mode, bind, cmd[1], cmd[2])
  end
end
