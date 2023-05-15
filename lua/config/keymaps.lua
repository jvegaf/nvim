-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local NS = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

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
keymap("n", "<leader>o", "o<Esc>", { noremap = true, silent = true, desc = "Insert line down" })
keymap("n", "<leader>O", "O<Esc>", { noremap = true, silent = true, desc = "Insert line up" })

keymap("n", "<leader>p", "<cmd>pu<cr>", { noremap = true, silent = true, desc = "Paste underline" })
keymap("n", "<leader>P", "<cmd>pu!<cr>", { noremap = true, silent = true, desc = "Paste overline" })

keymap("n", "<leader>R", "<cmd>source %<cr>", { noremap = true, silent = true, desc = "Reload" })

-- dont yank on visual paste
keymap("v", "p", '"_dP', NS)

keymap("n", "<F1>", "<cmd>vertical help<cr>", { noremap = true, silent = true, desc = "Vertical Help" })

keymap("n", "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save" })

keymap("n", "<leader>Sd", "<cmd>Alpha<cr>", { noremap = true, silent = true, desc = "Dashboard" })
keymap("n", "<leader>Sc", "<cmd>e $MYVIMRC<cr>", { noremap = true, silent = true, desc = "Config" })

keymap(
  "n",
  "<A-q>",
  "<cmd>lua require('mini.bufremove').delete(0, false)<cr>",
  { noremap = true, silent = true, desc = "Close buffer" }
)

keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "Next buffer" })
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "Prev buffer" })
