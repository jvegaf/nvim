vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.cmdheight = 2 -- more space in the neovim command line for displaying messages

local status = pcall(require, "jdtls")
if not status then
  return
end

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option

keymap(
  "n",
  "<leader>co",
  "<Cmd>lua require'jdtls'.organize_imports()<CR>",
  { silent = true, desc = "Organize imports" }
)
keymap(
  "n",
  "<leader>cv",
  "<Cmd>lua require('jdtls').extract_variable()<CR>",
  { silent = true, desc = "Extract variable" }
)
keymap(
  "n",
  "<leader>cc",
  "<Cmd>lua require('jdtls').extract_constant()<CR>",
  { silent = true, desc = "Extract constant" }
)
keymap(
  "n",
  "<leader>ct",
  "<Cmd>lua require'jdtls'.test_nearest_method()<CR>",
  { silent = true, desc = "Test nearest method" }
)
keymap("n", "<leader>cT", "<Cmd>lua require'jdtls'.test_class()<CR>", { silent = true, desc = "Test class" })
keymap("n", "<leader>cu", "<Cmd>JdtUpdateConfig<CR>", { silent = true, desc = "JDT Update Config" })

keymap(
  "v",
  "<leader>cv",
  "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
  { silent = true, desc = "Extract variable" }
)
keymap(
  "v",
  "<leader>cc",
  "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
  { silent = true, desc = "Extract constant" }
)
keymap(
  "v",
  "<leader>cm",
  "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
  { silent = true, desc = "Extract method" }
)
