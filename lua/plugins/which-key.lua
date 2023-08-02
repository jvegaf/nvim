return {
  "folke/which-key.nvim",
  opts = {
    defaults = {
      ["<leader>r"] = { name = "+Refactor" },
      ["<leader>S"] = { name = "+System" },
      ["<leader>g"] = {
        -- require install gitui   https://github.com/extrawurst/gitui
        t = { "<cmd>lua require('utils.term').git_client_toggle()<CR>", "Git TUI" },
      },
    },
  },
}
