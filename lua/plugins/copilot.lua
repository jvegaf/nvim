return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    keys = {
      { "<C-s>", "<cmd> lua require('copilot.suggestion').toggle_auto_trigger()<cr>", desc = "Toggle Copilot trigger" },
    },
    opts = {
      panel = {
        keymap = {
          jump_next = "<c-j>",
          jump_prev = "<c-k>",
          accept = "<c-l>",
          refresh = "r",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom",
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<a-l>",
          next = "<a-j>",
          prev = "<a-k>",
          dismiss = "<a-h>",
        },
      },
    },
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
}
