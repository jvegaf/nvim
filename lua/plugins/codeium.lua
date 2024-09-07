-- return {
--   {
--     "jcdickinson/codeium.nvim",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "hrsh7th/nvim-cmp",
--     },
--     -- event = "InsertEnter",
--     cmd = { "Codeium" },
--     config = function()
--       require("codeium").setup {}
--     end,
--   },
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "jcdickinson/codeium.nvim",
--     },
--     config = function(_, opts)
--       local cmp = require "cmp"
--       opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium" } }))
--     end,
--   },
-- }
-- return {
--   {
--     "Exafunction/codeium.vim",
--     event = "BufEnter",
--     config = function()
--       vim.g.codeium_disable_bindings = 1
--
--       vim.keymap.set("i", "<A-l>", function()
--         return vim.fn["codeium#Accept"]()
--       end, { expr = true })
--       vim.keymap.set("i", "<A-j>", function()
--         return vim.fn["codeium#CycleCompletions"](1)
--       end, { expr = true })
--       vim.keymap.set("i", "<A-k>", function()
--         return vim.fn["codeium#CycleCompletions"](-1)
--       end, { expr = true })
--       vim.keymap.set("i", "<A-x>", function()
--         return vim.fn["codeium#Clear"]()
--       end, { expr = true })
--     end,
--   },
--   {
--     "nvim-lualine/lualine.nvim",
--     event = "VeryLazy",
--     opts = function(_, opts)
--       table.insert(opts.sections.lualine_x, vim.fn["codeium#GetStatusString"]())
--     end,
--   },
-- }

return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  enabled = vim.fn.has("nvim-0.10") == 1,
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
    vim.keymap.set("i", "<A-f>", neocodeium.accept)
    vim.keymap.set("i", "<A-w>", function()
      require("neocodeium").accept_word()
    end)
    vim.keymap.set("i", "<A-a>", function()
      require("neocodeium").accept_line()
    end)
    vim.keymap.set("i", "<A-e>", function()
      require("neocodeium").cycle_or_complete()
    end)
    vim.keymap.set("i", "<A-r>", function()
      require("neocodeium").cycle_or_complete(-1)
    end)
    vim.keymap.set("i", "<A-c>", function()
      require("neocodeium").clear()
    end)
  end,
}
