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
      { "<leader>o", "<cmd>NvimTreeFocus<cr>",  desc = "NvimTree Focus" },
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
        update_root = true,
      },
      git = {
        timeout = 800,
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
      tab = {
        sync = {
          open = true,
          close = true,
          ignore = {},
        },
      },
    },
    config = function(_, opts)
      require("nvim-tree").setup(opts)

      -- local api = require("nvim-tree.api")
      -- api.events.subscribe(api.events.Event.FileCreated, function(file)
      --   vim.cmd("edit " .. file.fname)
      -- end)
      --
      vim.api.nvim_create_autocmd("QuitPre", {
        callback = function()
          local invalid_win = {}
          local wins = vim.api.nvim_list_wins()
          for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
              table.insert(invalid_win, w)
            end
          end
          if #invalid_win == #wins - 1 then
            -- Should quit, so we close all invalid windows.
            for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
          end
        end
      })
    end,
  },
}
