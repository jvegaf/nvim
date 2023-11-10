return {

  {
    "jvegaf/telescope-fzf-native.nvim",
    event = "VeryLazy",
    build = function()
      require("telescope-fzf-native").download_library({})
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      "jvegaf/telescope-fzf-native.nvim",
      "benfowler/telescope-luasnip.nvim",
      "debugloop/telescope-undo.nvim",
      {
        "paopaol/telescope-git-diffs.nvim",
        dependencies = { "sindrets/diffview.nvim" },
      },
    },
    event = "VeryLazy",
    config = function()
      require("config.telescope.setup")
      require("config.telescope.mappings")
    end,
  },
}
