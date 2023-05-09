return {
  {
    "kosayoda/nvim-lightbulb",
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
    },
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    keys = {
      { "<leader>xc", "<cmd>CodeActionMenu<cr>", desc = "CodeActionMenu" },
    },
  },
}
