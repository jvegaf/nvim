vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.cmdheight = 4 -- more space in the neovim command line for displaying messages

-- local status = pcall(require, "jdtls")
-- if not status then
--   return
-- end
--
--
local home = os.getenv("HOME")


local dataFolder = home .. "/.local/share/nvim"

require('jdtls').start_or_attach {
  cmd = {
    "bash",
    home .. '/.config/nvim/scripts/java-lsp.bash',
    dataFolder,
    "java"
  },

  settings = {
    java = {
      configuration = {
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- And search for `interface RuntimeOption`
        -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
        runtimes = {
          -- {
          --   name = "JavaSE-17",
          --   path = "/Users/simon/.config/nvim/jdk/jdk-17.0.2.jdk/Contents/Home/",
          -- },
          -- {
          --   name = "JavaSE-18",
          --   path = "/Users/simon/.config/nvim/jdk/jdk-18.jdk/Contents/Home/",
          -- },
          -- {
          --   name = "JavaSE-21",
          --   path = "/Users/simon/.config/nvim/jdk/jdk-21.jdk/Contents/Home/",
          -- },
        }
      }
    }
  }
}


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
