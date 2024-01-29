return {
  "hinell/duplicate.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>D", "<cmd>LineDuplicate +1<cr>", desc = "Duplicate line" },
    { "<leader>d", mode = "v", "<cmd>VisualDuplicate +1<cr>", desc = "Duplicate " },
  }
}
