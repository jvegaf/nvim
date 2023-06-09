return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    event = "VimEnter",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree Toggle" },
      { "<leader>o", "<cmd>NvimTreeFocus<cr>", desc = "NvimTree Focus" },
    },
    opts = {
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        root_folder_modifier = ":~",
        icons = {
          glyphs = {
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "➜",
              untracked = "",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
      update_focused_file = {
        enable = true,
      },
      git = {
        timeout = 500,
      },
      actions = {
        open_file = {
          quit_on_open = true,
          resize_window = false,
        },
      },
      view = {
        width = 40,
        side = "left",
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
    },
  },
}
