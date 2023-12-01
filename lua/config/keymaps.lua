local map = function(modes, lhs, rhs, opts)
  local options = { silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  if type(modes) == "string" then
    modes = { modes }
  end
  for _, mode in ipairs(modes) do
    vim.keymap.set(mode, lhs, rhs, options)
  end
end

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", ":resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
-- map("i", "<A-j>", "<esc>:m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc>:m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Buffers
map("n", "<S-h>", ":BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", ":BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", ":e #<cr>", { desc = "Switch to Other buffer" })

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
map("n", "<leader>fr", ":Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
map("n", "<leader>fs", ":Telescope live_grep<cr>", { desc = "Find string in cwd" })
map("n", "<leader>fc", ":Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

--keywordprg
map("n", "<leader>K", ":norm! K<cr>", { desc = "Keywordprg" })

-- Clear search with <esc>
map("n", "<esc>", ":noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- windows
map("n", "<A-w>", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>.", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>/", "<C-W>v", { desc = "Split window right", remap = true })

-- tabs
map("n", "<leader><tab>l", ":tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", ":tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", ":tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", ":tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", ":tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", ":tabprevious<cr>", { desc = "Previous Tab" })

-- Code/LSP
map("n", "<leader>xs", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "<leader>cl", ":LspInfo<cr>", { desc = "LSP Info" })
map("n", "<leader>xc", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "gd", function()
  require("telescope.builtin").lsp_definitions({ reuse_win = true })
end, { desc = "Goto Definition" })
map("n", "gr", ":Telescope lsp_references<cr>", { desc = "Goto References" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "gI", function()
  require("telescope.builtin").lsp_implementations({ reuse_win = true })
end, { desc = "Goto Implementation" })
map("n", "gy", function()
  require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
end, { desc = "Goto Type Definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Dont move cursor after yank
map({ "v", "x" }, "y", "ygv<ESC>", { desc = "Yank" })

map("n", "vv", "V", { desc = "Visual line mode" })

map("i", "jk", "<ESC>", { desc = "Change to Normal Mode" })
-- map("i", "kk", "<ESC>", NS)

-- dont yank on visual paste
map("v", "p", '"_dP', { desc = "Paste without yank" })

map("v", "<", "<gv", { desc = "Stay in indent mode" })
map("v", ">", ">gv", { desc = "Stay in indent mode" })

map("n", "<leader>w", ":write<cr>", { noremap = true, silent = true, desc = "Save" })

-- quit
map("n", "<A-q>", ":qa<cr>", { desc = "Close All" })
map("n", "<leader>q", ":quit<cr>", { desc = "Close Window" })

-- System
map("n", "<leader>sd", ":Alpha<cr>", { desc = "Dashboard" })
map("n", "<leader>sc", ":e $MYVIMRC<cr>", { desc = "Config" })
map("n", "<leader>sn", ":Telescope notify<cr>", { desc = "Notifications" })
map("n", "<leader>sh", ":checkhealth<cr>", { desc = "Health" })
map("n", "<leader>sm", ":Mason<cr>", { desc = "Mason" })
map("n", "<leader>sa", ":messages<cr>", { desc = "Messages" })
map("n", "<leader>sl", ":Lazy<cr>", { desc = "Lazy" })

map("n", "<F1>", ":Helptags<cr>", { desc = "Help Tags" })

-- UI
map(
  "n",
  "<leader>ub",
  ':exec &bg=="light"? "set bg=dark" : "set bg=light"<cr>',
  { noremap = true, silent = true, desc = "Toggle Background" }
)

--Find
map("n", "<leader>fh", ":Helptags<cr>", { desc = "Find Files" })

-- Git
map("n", "<leader>ghs", ":Gitsigns stage_buffer<cr>", { desc = "Stage buffer" })
map("n", "<leader>ghu", ":Gitsigns undo_stage_buffer<cr>", { desc = "Undo stage buffer" })
map("n", "<leader>ghr", ":Gitsigns reset_buffer<cr>", { desc = "Reset buffer" })
map("n", "<leader>ghp", ":Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
map("n", "<leader>ghb", ":Gitsigns blame_line<cr>", { desc = "Blame line" })
map("n", "<leader>ghn", ":Gitsigns next_hunk<cr>", { desc = "Next hunk" })
map("n", "<leader>ghp", ":Gitsigns prev_hunk<cr>", { desc = "Prev hunk" })
map("n", "<leader>ghr", ":Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
map("n", "<leader>ghs", ":Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
map("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<cr>", { desc = "Undo stage hunk" })
map("n", "<leader>ghv", ":Gitsigns select_hunk<cr>", { desc = "Select hunk" })
map("n", "<leader>ghl", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle current line blame" })
map("n", "<leader>gd", ":DiffviewOpen<cr>", { desc = "DiffviewOpen" })
map("n", "<leader>gD", ":DiffviewClose<cr>", { desc = "DiffviewClose" })
map("n", "<leader>gf", ":DiffviewFileHistory %<cr>", { desc = "DiffviewFileHistory" })
map("v", "<leader>gf", ":'<,'>DiffviewFileHistory<cr>", { desc = "Diffview Selected History" })
map("v", "<leader>gg", ":LazyGit<cr>", { desc = "LazyGit" })
