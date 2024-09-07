-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
local NS = { noremap = true, silent = true }

-- Shorten function name
local map = vim.keymap.set

map("n", "x", '"_x', NS)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", NS)

-- Select all
map("n", "<leader>a", "gg<S-v>G", NS)

map("n", "vv", "V", NS)

map("i", "jk", "<ESC>", NS)

-- Jumplist
map("n", "<C-m>", "<C-i>", NS)

-- Split window
map("n", "ss", ":split<Return>", NS)
map("n", "sv", ":vsplit<Return>", NS)
-- Move window
map("n", "sh", "<C-w>h")
map("n", "sk", "<C-w>k")
map("n", "sj", "<C-w>j")
map("n", "sl", "<C-w>l")

-- Resize window
map("n", "<C-w><left>", "<C-w><")
map("n", "<C-w><right>", "<C-w>>")
map("n", "<C-w><up>", "<C-w>+")
map("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
map("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, NS)

-- dont yank on visual paste
map("v", "p", '"_dP', NS)

map("n", "W", ":write<cr>", { noremap = true, silent = true, desc = "Save" })

-- System
map("n", "<leader>zd", ":Dashboard<cr>", { noremap = true, silent = true, desc = "Dashboard" })
map("n", "<leader>ze", ":LazyExtras<cr>", { noremap = true, silent = true, desc = "Lazy Extras" })
map("n", "<leader>zc", ":e $MYVIMRC<cr>", { noremap = true, silent = true, desc = "Config" })
map("n", "<leader>zn", ":Telescope notify<cr>", { noremap = true, silent = true, desc = "Notifications" })
map("n", "<leader>zh", ":checkhealth<cr>", { noremap = true, silent = true, desc = "Health" })
map("n", "<leader>zm", ":Mason<cr>", { noremap = true, silent = true, desc = "Mason" })
map("n", "<leader>za", ":messages<cr>", { desc = "Messages" })

-- UI
map(
  "n",
  "<leader>ub",
  ':exec &bg=="light"? "set bg=dark" : "set bg=light"<cr>',
  { noremap = true, silent = true, desc = "Toggle Background" }
)

map("n", "gq", ":LazyFormat<cr>", { desc = "Format File" })

-- map("n", "gq", function()
--   Util.format({ force = true })
-- end, { desc = "LSP format file" })

-- map(
--   "n",
--   "<Tab>",
--   ":lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
--   { noremap = true, silent = true, desc = "Buffers" }
-- )

map("n", "<Tab>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "Buffers" })
map("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "Buffers" })

map("n", "Q", ":bdelete<cr>", { noremap = true, silent = true, desc = "Close buffer" })

map("n", "<leader>q", ":quit<cr>", { noremap = true, silent = true, desc = "Close Window" })

map("v", "<", "<gv", { noremap = true, silent = true, desc = "Stay in indent mode" })
map("v", ">", ">gv", { noremap = true, silent = true, desc = "Stay in indent mode" })
