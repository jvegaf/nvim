return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      -- TODO: complete keymaps
      { "<leader>ght", "<cmd>Gitsigns toggle_signs<cr>", desc = "Toggle signs" },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diff" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close diff" },
      { "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "View file history" },
      { "<leader>gf", ":'<,'>DiffviewFileHistory<cr>", mode = { "v" }, desc = "View selected history" },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    opts = {
      disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = "DiffText",
        current = "DiffAdd",
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}
