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
    { "<leader>ff", function() require 'telescope'.builtin.find_files() end, desc = "Find Files" },
    { "<leader>fh", function() require 'telescope'.builtin.help_tags() end, desc = "Find Help Tags" },
    { "<leader><Space>", function() require 'telescope'.builtin.git_files() end, desc = "Find Git Files" },
    { "<leader>fw", function() require 'telescope'.builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, desc = "Find Text" },
    { "<leader>u", function() require 'telescope'.extensions.undo.undo() end, desc = "Undo View" },
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
