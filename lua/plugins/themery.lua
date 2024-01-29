return {
  -- "zaldih/themery.nvim",
  "Subarctic2796/themery.nvim",
  event = "VeryLazy",
  opts = {
    -- themes = { "gruvbox", "ayu", ... }, -- Your list of installed colorschemes
    themeConfigFile = "~/.config/nvim/lua/config/theme.lua", -- Described below
    livePreview = true, -- Apply theme while browsing. Default to true.
  },
  keys = {
    { "<leader>ut", "<cmd>Themery<cr>", desc = "Themery" },
  }
}
