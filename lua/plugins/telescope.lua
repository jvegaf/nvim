return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-lua/plenary.nvim",
    "benfowler/telescope-luasnip.nvim",
    "debugloop/telescope-undo.nvim",
    {
      "paopaol/telescope-git-diffs.nvim",
      dependencies = { "sindrets/diffview.nvim" },
    },
  },
  keys = {
    -- stylua: ignore
    {"<leader>bv", function() require("telescope").extensions.file_browser.file_browser() end, desc = "Browse Files"},
    { "<leader>fs", function() require 'telescope'.extensions.luasnip.luasnip {} end, desc = "Search snippets" },
    { "<leader>u", function() require 'telescope'.extensions.undo.undo() end, desc = "Undo View" },
    { "<leader>gz", "<cmd>Telescope git_diffs  diff_commits<CR>", desc = "Diff commits" },
  },
  opts = {
    extensions = {
      file_browser = {
        hijack_netrw = true,
      },
      undo = {
        side_by_side = true,
        layout_strategy = "vertical",
        layout_config = {
          preview_height = 0.8,
        },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("luasnip")
    require("telescope").load_extension("undo")
    require("telescope").load_extension("git_diffs")
  end,
}
