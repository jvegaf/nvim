-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

map("i", "jj", "<ESC>", NS)

-- dont yank on visual paste
map({ "v", "x" }, "p", '"_dP', NS)

map("n", "<F1>", "<cmd>vertical help<cr>", { noremap = true, silent = true, desc = "Vertical Help" })

map("n", "<A-w>", "<cmd>write<cr>", { noremap = true, silent = true, desc = "Save" })

-- System
map("n", "<leader>Sd", "<cmd>Alpha<cr>", { noremap = true, silent = true, desc = "Dashboard" })
map("n", "<leader>Sc", "<cmd>e $MYVIMRC<cr>", { noremap = true, silent = true, desc = "Config" })
map("n", "<leader>Sn", "<cmd>Telescope notify<cr>", { noremap = true, silent = true, desc = "Notifications" })
map("n", "<leader>Sh", "<cmd>checkhealth<cr>", { noremap = true, silent = true, desc = "Health" })

map(
  "n",
  "<leader>ub",
  '<cmd>exec &bg=="light"? "set bg=dark" : "set bg=light"<cr>',
  { noremap = true, silent = true, desc = "Toggle Background" }
)

-- map(
--   "n",
--   "<Tab>",
--   "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
--   { noremap = true, silent = true, desc = "Buffers" }
-- )

map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "Buffers" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "Buffers" })

map(
  "n",
  "<A-q>",
  "<cmd>lua require('mini.bufremove').delete(0, false)<cr>",
  { noremap = true, silent = true, desc = "Close buffer" }
)

map("n", "zz", "<cmd>wq<cr>", { noremap = true, silent = true, desc = "Save Buffer and Close" })

map("n", "<leader>q", "<cmd>quit<cr>", { noremap = true, silent = true, desc = "Close Window" })

map("i", "<A-l>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })
map("i", "<A-j>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true })
map("i", "<A-k>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true })
map("i", "<A-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true })
