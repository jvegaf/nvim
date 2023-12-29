local status = pcall(require, "rust-tools")
if not status then
	return
end

local M = {}

function M.load(args)
	-- lspconfig.dartls.setup({
	-- 	on_attach = args.on_attach,
	-- 	capabilities = args.capabilities,
	-- 	flags = args.flags,
	-- })
require("rust-tools").setup({
  tools = {
    executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
    reload_workspace_from_cargo_toml = true,
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      only_current_line = false,
      show_parameter_hints = false,
      parameter_hints_prefix = "<-",
      other_hints_prefix = "=>",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
    },
    hover_actions = {
      border = "rounded",
    },
    on_initialized = function()
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
        pattern = { "*.rs" },
        callback = function()
          local _, _ = pcall(vim.lsp.codelens.refresh)
        end,
      })
    end,
  },
  dap = {
    -- adapter= codelldb_adapter,
    -- adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  },
  server = {
    on_attach = function(client, bufnr)
      require("lvim.lsp").common_on_attach(client, bufnr)
      local rt = require("rust-tools")
      vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
    end,

    capabilities = args.capabilities,
    settings = {
      ["rust-analyzer"] = {
        lens = {
          enable = true,
        },
        checkOnSave = {
          enable = true,
          command = "clippy",
        },
      },
    },
  },
})
end

return M
