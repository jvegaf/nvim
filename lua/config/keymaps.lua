-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local NS = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

keymap("n", "<C-i>", "<C-i>", NS)

keymap("n", "x", '"_x', NS)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Cancel search highlighting with ESC
keymap("n", "<ESC><ESC>", ":nohlsearch<Bar>:echo<CR>", NS)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", NS)

keymap("n", "vv", "V", NS)

keymap("i", "jj", "<ESC>", NS)

keymap("n", "<leader>p", "<cmd>pu<cr>", { noremap = true, silent = true, desc = "Paste underline" })
keymap("n", "<leader>P", "<cmd>pu!<cr>", { noremap = true, silent = true, desc = "Paste overline" })

keymap("n", "<leader>R", "<cmd>source %<cr>", { noremap = true, desc = "Reload" })

-- dont yank on visual paste
keymap({ "v", "x" }, "p", '"_dP', NS)

keymap("n", "<F1>", "<cmd>vertical help<cr>", { noremap = true, silent = true, desc = "Vertical Help" })

keymap("n", "<leader>w", "<cmd>write<cr>", { noremap = true, silent = true, desc = "Save" })

keymap("n", "<leader>Sd", "<cmd>Alpha<cr>", { noremap = true, silent = true, desc = "Dashboard" })
keymap("n", "<leader>Sc", "<cmd>e $MYVIMRC<cr>", { noremap = true, silent = true, desc = "Config" })
keymap("n", "<leader>Sn", "<cmd>Telescope notify<cr>", { noremap = true, silent = true, desc = "Notifications" })
keymap("n", "<leader>Sh", "<cmd>checkhealth<cr>", { noremap = true, silent = true, desc = "Health" })

keymap(
  "n",
  "<A-q>",
  "<cmd>lua require('mini.bufremove').delete(0, false)<cr>",
  { noremap = true, silent = true, desc = "Close buffer" }
)

keymap("n", "zz", "<cmd>wq<cr>", { noremap = true, silent = true, desc = "Save Buffer and Close" })

keymap("n", "<leader>q", "<cmd>quit<cr>", { noremap = true, silent = true, desc = "Close Window" })
