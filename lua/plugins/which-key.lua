return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>r", group = "+Refactor" },
      { "<leader>i", group = "+AnyJump" },
      { "<leader>z", group = "+System" },
      { "<leader>gt", "<cmd>lua require('utils.term').git_client_toggle()<CR>", desc = "Git TUI" },
    })
  end,
}
