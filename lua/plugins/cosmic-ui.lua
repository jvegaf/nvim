return {
  "CosmicNvim/cosmic-ui",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {},
  keys = {
    { 'gn', '<cmd>lua require("cosmic-ui").rename()<cr>', desc = 'Rename' },
    { '<leader>xf', '<cmd>lua require("cosmic-ui").code_actions()<cr>', desc = 'Code Actions' },
    { '<leader>xf', '<cmd>lua require("cosmic-ui").range_code_actions()<cr>', mode = 'v', desc = 'Code Actions' },
  }
}
