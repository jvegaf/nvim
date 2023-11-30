-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
local NS = { noremap = true, silent = true }

-- Shorten function name
local map = vim.keymap.set

map("n", "<C-i>", "<C-i>", NS)

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
map("n", "<C-a>", "gg<S-v>G", NS)

map("n", "vv", "V", NS)

map("i", "jk", "<ESC>", NS)

-- dont yank on visual paste
map("v", "p", '"_dP', NS)

map("n", "<A-w>", ":write<cr>", { noremap = true, silent = true, desc = "Save" })

-- System
map("n", "<leader>Sd", ":Alpha<cr>", { noremap = true, silent = true, desc = "Dashboard" })
map("n", "<leader>Sc", ":e $MYVIMRC<cr>", { noremap = true, silent = true, desc = "Config" })
map("n", "<leader>Sn", ":Telescope notify<cr>", { noremap = true, silent = true, desc = "Notifications" })
map("n", "<leader>Sh", ":checkhealth<cr>", { noremap = true, silent = true, desc = "Health" })
map("n", "<leader>Sm", ":Mason<cr>", { noremap = true, silent = true, desc = "Mason" })
map("n", "<leader>sa", ":messages<cr>", { desc = "Messages" })

-- UI
map(
  "n",
  "<leader>ub",
  ':exec &bg=="light"? "set bg=dark" : "set bg=light"<cr>',
  { noremap = true, silent = true, desc = "Toggle Background" }
)

map("n", "gq", function()
  Util.format({ force = true })
end, { desc = "LSP format file" })

-- map(
--   "n",
--   "<Tab>",
--   ":lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
--   { noremap = true, silent = true, desc = "Buffers" }
-- )

-- map("n", "<Tab>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "Buffers" })
-- map("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "Buffers" })

map(
  "n",
  "<A-q>",
  ":lua require('mini.bufremove').delete(0, false)<cr>",
  { noremap = true, silent = true, desc = "Close buffer" }
)

map("n", "<leader>q", ":quit<cr>", { noremap = true, silent = true, desc = "Close Window" })

map("v", "<", "<gv", { noremap = true, silent = true, desc = "Stay in indent mode" })
map("v", ">", ">gv", { noremap = true, silent = true, desc = "Stay in indent mode" })
