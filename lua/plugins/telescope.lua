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
    {"<leader>bv", "<cmd>Telescope file_browser <cr>", desc = "Browse Files"},
    { "<leader>fs", "<cmd>Telescope luasnip<cr>", desc = "Search snippets" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help Tags" },
    { "<leader><Space>", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },
    { "<leader>fw", "<cmd>Telescope grep_string({ search = vim.fn.input('Grep > ') }) <cr>", desc = "Find Text" },
    { "<leader>u", "<cmd>Telescope undo<cr>", desc = "Undo View" },
    { "<leader>gz", "<cmd>Telescope git_diffs  diff_commits<CR>", desc = "Diff commits" },
    { "<leader>cs", "<cmd>Telescope symbols <cr>", desc = "Symbols" },
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
