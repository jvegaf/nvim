return {
	"chrisgrieser/nvim-scissors",
  event = "VeryLazy",
	dependencies = "nvim-telescope/telescope.nvim", -- optional
	opts = {},
  keys = {
    { "<leader>csa", "lua require('scissors').addNewSnippet()", desc = "Edit Snippet" },
    { "<leader>cse", "lua require('scissors').editSnippet()", desc = "Edit Snippet" },
  }
}
