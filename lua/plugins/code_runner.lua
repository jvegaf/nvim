return {
  "CRAG666/code_runner.nvim",
  event = "VeryLazy",
  config = true,
  keys = {
    { "<leader>crc", ":RunCode<CR>", desc = "Run code" },
    { "<leader>crr", ":RunFile<CR>", desc = "Run file" },
    { "<leader>crf", ":RunFile tab<CR>", desc = "Run file tab" },
    { "<leader>crp", ":RunProject<CR>", desc = "Run project" },
    { "<leader>crq", ":RunClose<CR>", desc = "Run close" },
    { "<leader>crt", ":CRFiletype<CR>", desc = "Run filetype" },
    { "<leader>crP", ":CRProjects<CR>", desc = "Run projects" },
  }
}
