return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup()
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = { "ChatGPTActAs", "ChatGPT" },
  keys = {
    { "<leader>cx", "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
    {
      "<leader>v",
      function()
        require("chatgpt").edit_with_instructions()
      end,
      desc = "ChatGPT",
      mode = { "v" },
    },
  },
}
