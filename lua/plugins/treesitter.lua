return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-context",
    "windwp/nvim-ts-autotag",
  },
  opts = {
    ensure_installed = {
      "bash",
      "cpp",
      "css",
      "html",
      "java",
      "javascript",
      "json",
      "json5",
      "kotlin",
      "lua",
      "prisma",
      "scss",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
    auto_install = true,
    refactor = {
      highlight_definitions = {
        enable = true,
        -- Set to false if you have an `updatetime` of ~100.
        clear_on_cursor_move = true,
      },
      highlight_current_scope = { enable = false },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "<leader>xr",
        },
      },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "<leader>md",
          list_definitions = "<leader>mD",
          list_definitions_toc = "<leader>mo",
          goto_next_usage = "<leader>mj",
          goto_previous_usage = "<leader>mk",
        },
      },
    },

    autotag = {
      enable = true,
    },
  },
}
