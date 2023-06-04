return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  keys = {
      -- stylua: ignore
      {
        "<leader>bv",
        function() require("telescope").extensions.file_browser.file_browser() end,
        desc = "Browse Files",
      },
  },
  opts = {
    extensions = {
      file_browser = {
        hijack_netrw = true,
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("file_browser")
  end,
}
