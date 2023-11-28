local map_tele = function(key, f, opts)
  local default = {
    mode = "n",
    options = {},
    buffer = nil,
    desc = nil,
  }
  opts = opts or {}
  opts = vim.tbl_deep_extend("force", default, opts or {})

  local rhs = function()
    R("config.telescope")[f](opts.options)
  end

  local map_options = {
    remap = false,
    silent = true,
  }
  if opts.buffer then
    map_options.buffer = opts.buffer
  end
  if opts.desc then
    map_options.desc = "Telescope: " .. opts.desc
  end

  vim.keymap.set(opts.mode, key, rhs, map_options)
end

-- not shure what this line does
vim.api.nvim_set_keymap(
  "c",
  "<c-r><c-r>",
  "<Plug>(TelescopeFuzzyCommandSearch)",
  { noremap = false, nowait = true, desc = "In comand look for previous commands" }
)

map_tele("<leader><space>", "git_files", { desc = "Find Git Files" })
map_tele("<leader>bl", "buffers", { desc = "Open buffers" })
map_tele("<leader>br", "file_browser_relative", { desc = "Current directory" })
map_tele("<leader>bt", "treesitter", { desc = "Treesitter buffer elements" })
map_tele("<leader>bv", "file_browser", { desc = "Project directory" })
map_tele("<leader>fC", "find_nvim_config", { desc = "Search Files in nvim config directory" })
map_tele("<leader>fS", "luasnip", { desc = "Find Snippets" })
map_tele("<leader>ff", "project_files", { desc = "Open Project files" })
map_tele("<leader>fh", "help_tags", { desc = "Neovim Help" })
map_tele("<leader>fr", "oldfiles", { desc = "Find recent files" })
map_tele("<leader>fs", "grep_string", { desc = "Grep provided input string" })
map_tele("<leader>fw", "grep_word", { desc = "Grep word under cursor" })
map_tele("<leader>gb", "branches", { desc = "Git Branches selector" })
map_tele("<leader>gs", "git_status", { desc = "Git status" })
map_tele("<leader>gz", "git_diffs diff_commits", { desc = "Git Diff Commits" })
map_tele("<leader>uc", "colorscheme", { desc = "Colorscheme" })
map_tele("<leader>u", "undo", { desc = "Undo View" })
map_tele("<leader>xx", "diagnostics", { desc = "Diagnostic of the buffer" })

return map_tele
