return {
  "hedyhli/outline.nvim",
  event = "BufRead",
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {},
}
