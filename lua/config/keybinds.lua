local keybinds = {
  i = {},
  n = {
    -- Telescope
    ["<leader>ff"] = "<cmd>Telescope find_files<cr>",
    ["<leader>fo"] = "<cmd>Telescope oldfiles<cr>",
    ["<leader>fw"] = "<cmd>Telescope live_grep<cr>",
    ["<leader>fb"] = "<cmd>Telescope buffers<cr>",
    -- ToggleTerm
    ["<leader>th"] = "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
    ["<leader>tv"] = "<cmd>ToggleTerm size=80 direction=vertical<cr>",
    ["<leader>tf"] = "<cmd>ToggleTerm direction=float<cr>",
    ["<C-'>"] = "<cmd>ToggleTerm<cr>",
    -- Packer
    ["<leader>pc"] = "<cmd>PackerCompile<cr>",
    ["<leader>pC"] = "<cmd>PackerClean<cr>",
    ["<leader>ps"] = "<cmd>PackerSync<cr>",
    ["<leader>pS"] = "<cmd>PackerStatus<cr>",
    ["<leader>pu"] = "<cmd>PackerUpdate<cr>",
    -- Comment
    ["<leader>/"] = function() require("Comment.api").toggle.linewise.current() end,
    ["<C-/>"] = function() require("Comment.api").toggle.linewise.current() end,
    -- NeoTree
    ["<C-n>"] = "<cmd>Neotree toggle<cr>",
    -- Git
    ["<leader>gc"] = "<cmd>Telescope git_commits<cr>",
    ["<leader>gb"] = "<cmd>Telescope git_branches<cr>",
    ["<leader>gs"] = "<cmd>Telescope git_status<cr>",
    -- LSP
    ["<leader>li"] = "<cmd>LspInfo<cr>",
    ["<leader>ll"] = "<cmd>LspLog<cr>",
    -- Util
    ["<leader>sk"] = "<cmd>Telescope keymaps<cr>",
    ["<leader>sc"] = "<cmd>Telescope commands<cr>",
    -- Rebinds
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<C-l>"] = "<C-w>l",
    ["<C-h>"] = "<C-w>h",
    ["<leader>r"] = "<cmd>source $MYVIMRC<cr>",
    ["<leader><leader>"] = "<nop>",
  },
  t = {
    ["<C-j>"] = "<C-\\><C-n><C-w>j",
    ["<C-k>"] = "<C-\\><C-n><C-w>k",
    ["<C-h>"] = "<C-\\><C-n><C-w>h",
    ["<C-l>"] = "<C-\\><C-n><C-w>l",
    ["<Esc>"] = "<C-\\><C-n>",
    ["<C-'>"] = "<cmd>ToggleTerm<cr>",
    -- NeoTree
    ["<C-n>"] = "<cmd>Neotree toggle<cr>",
  },
  v = {
    -- Comment
    ["<leader>/"] = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    ["<C-/>"] = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    -- Rebinds
    ["<"] = "<gv",
    [">"] = ">gv",
  },
}

for mode, binds in pairs(keybinds) do
  for bind, cmd in pairs(binds) do
    vim.keymap.set(mode, bind, cmd, {})
  end
end
