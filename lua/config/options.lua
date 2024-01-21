
local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  -- cmdheight = 2, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  cursorline = true, -- highlight the current line
  encoding = "utf-8",
  expandtab = true, -- convert tabs to spaces
  fileencoding = "utf-8", -- the encoding written to a file
  foldcolumn = "1",
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  incsearch = false,
  laststatus = 3,
  mouse = "a", -- allow the mouse to be used in neovim
  number = true, -- set numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  pumheight = 15, -- pop up menu height
  relativenumber = true, -- set relative numbered lines
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  showcmd = true,
  showmode = true, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  sidescrolloff = 8,
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  tabstop = 2, -- insert 2 spaces for a tab
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeout = true,
  timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
  title = true,
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  wrap = false, -- display lines as one long line
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  winbar = "%=%m %f",
}

vim.g.mapleader = ","
-- vim.g.maplocalleader = " "

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

for k, v in pairs(options) do
  vim.opt[k] = v
end
