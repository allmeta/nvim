local keybinds = {
  i = {},
  n = {
    -- Telescope
    ["<leader>ff"] = {"<cmd>Telescope find_files<cr>", {desc = "Find files"}},
    ["<leader>fo"] = {"<cmd>Telescope oldfiles<cr>", {desc = "Old files"}},
    ["<leader>fw"] = {"<cmd>Telescope live_grep<cr>", {desc = "Grep"}},
    ["<leader>fb"] = {"<cmd>Telescope buffers<cr>", {desc = "Buffers"}},
    -- ToggleTerm
    ["<leader>th"] = {"<cmd>ToggleTerm size=10 direction=horizontal<cr>", {desc = "Terminal horizontal"}},
    ["<leader>tv"] = {"<cmd>ToggleTerm size=80 direction=vertical<cr>", {desc = "Terminal vertical"}},
    ["<leader>tf"] = {"<cmd>ToggleTerm direction=float<cr>", {desc = "Terminal floating"}},
    ["<C-'>"] = {"<cmd>ToggleTerm<cr>", {}},
    -- Packer
    ["<leader>pc"] = {"<cmd>PackerCompile<cr>", {desc = "Packer compile"}},
    ["<leader>pC"] = {"<cmd>PackerClean<cr>", {desc = "Packer clean"}},
    ["<leader>ps"] = {"<cmd>PackerSync<cr>", {desc = "Packer sync"}},
    ["<leader>pS"] = {"<cmd>PackerStatus<cr>", {desc = "Packer status"}},
    ["<leader>pu"] = {"<cmd>PackerUpdate<cr>", {desc = "Packer update"}},
    -- Comment
    ["<leader>/"] = {function() require("Comment.api").toggle.linewise.current() end,{desc = "Comment"}},
    ["<C-/>"] = {function() require("Comment.api").toggle.linewise.current() end,{desc = "Comment"}},
    -- NeoTree
    ["<C-n>"] = {"<cmd>Neotree toggle<cr>", {}},
    -- Git
    ["<leader>gc"] = {"<cmd>Telescope git_commits<cr>", {desc = "Git commits"}},
    ["<leader>gb"] = {"<cmd>Telescope git_branches<cr>", {desc = "Git branches"}},
    ["<leader>gs"] = {"<cmd>Telescope git_status<cr>", {desc = "Git status"}},
    -- LSP
    ["<leader>li"] = {"<cmd>LspInfo<cr>", {desc = "Lsp info"}},
    ["<leader>ll"] = {"<cmd>LspLog<cr>", {desc = "Lsp log"}},
    ["<leader>lI"] = {"<cmd>Mason<cr>", {desc = "Lsp install"}},
    -- Util
    ["<leader>sk"] = {"<cmd>Telescope keymaps<cr>", {desc = "Search keymaps"}},
    ["<leader>sc"] = {"<cmd>Telescope commands<cr>", {desc = "Search commands"}},
    -- Rebinds
    ["<C-j>"] = {"<C-w>j", {}},
    ["<C-k>"] = {"<C-w>k", {}},
    ["<C-l>"] = {"<C-w>l", {}},
    ["<C-h>"] = {"<C-w>h", {}},
    ["<leader>r"] = {"<cmd>source $MYVIMRC<cr>", {desc = "Reload config"}},
    ["<leader><leader>"] = {"<nop>", {}},
    -- Misc
    ["<leader>c"] = {"<cmd>cd %:h<cr>", {desc = "cd"}},
  },
  t = {
    ["<C-j>"] = {"<C-\\><C-n><C-w>j", {}},
    ["<C-k>"] = {"<C-\\><C-n><C-w>k", {}},
    ["<C-h>"] = {"<C-\\><C-n><C-w>h", {}},
    ["<C-l>"] = {"<C-\\><C-n><C-w>l", {}},
    ["<Esc>"] = {"<C-\\><C-n>", {}},
    ["<C-'>"] = {"<cmd>ToggleTerm<cr>", {}},
    -- NeoTree
    ["<C-n>"] = {"<cmd>Neotree toggle<cr>", {}},
  },
  v = {
    -- Comment
    ["<leader>/"] = {"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", {}},
    ["<C-/>"] = {"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", {}},
    -- Rebinds
    ["<"] = {"<gv", {}},
    [">"] = {">gv", {}},
  },
}

for mode, binds in pairs(keybinds) do
  for bind, cmd in pairs(binds) do
    vim.keymap.set(mode, bind, cmd[1], cmd[2])
  end
end
