local opt = {
  clipboard = "", -- Connection to the system clipboard
  cmdheight = 0, -- hide command line unless needed
  completeopt = "menu,menuone,noselect", -- Options for insert mode completion
  cursorline = true, -- Highlight the text line of the cursor
  history = 100, -- Number of commands to remember in a history table
  ignorecase = true, -- Case insensitive searching
  laststatus = 3, -- globalstatus
  mouse = "a", -- Enable mouse support
  number = true, -- Show numberline
	paste = false, -- Disable comment continuation on <CR>
  pumheight = 10, -- Height of the pop up menu
  relativenumber = true, -- Show relative numberline
  scrolloff = 8, -- Number of lines to keep above and below the cursor
  fillchars = { eob = " " }, -- Disable `~` on nonexistent lines
  shiftround = true, -- Round indent
  shiftwidth = 2, -- Number of space inserted for indentation
  tabstop = 2, -- Number of space in a tab
  expandtab = true, -- Enable the use of space in tab
  smartindent = true, -- Insert indents automatically
  showtabline = 0, -- always display tabline
  showmode = false, -- Disable showing modes in command line
  sidescrolloff = 8, -- Number of columns to keep at the sides of the cursor
  signcolumn = "yes", -- Always show the sign column
  smartcase = true, -- Case sensitivie searching
  splitbelow = true, -- Splitting a new window below the current one
  splitright = true, -- Splitting a new window at the right of the current one
  swapfile = false, -- Disable use of swapfile for the buffer
  termguicolors = true, -- Enable 24-bit RGB color in the TUI
  timeoutlen = 300, -- Length of time to wait for a mapped sequence
  undofile = true, -- Enable persistent undo
  updatetime = 300, -- Length of time to wait before triggering the plugin
  wrap = true, -- Disable wrapping of lines longer than the width of window
  writebackup = false, -- Disable making a backup before overwriting a file
  splitkeep = 'screen', -- Keep the text on the same screen line.
}

local g = {
  mapleader = " ", -- set leader key
  diagnostics_enabled = true, -- enable diagnostics at start
  status_diagnostics_enabled = true, -- enable diagnostics in statusline
  markdown_recommended_style = 0, -- Fix markdown indentation settings
  neo_tree_remove_legacy_commands = 1,
}

for k, v in pairs(opt) do
  vim.opt[k] = v
end

for k, v in pairs(g) do
  vim.g[k] = v
end

vim.filetype.add({
  extension = {
    pp = 'ruby',
  }
})
