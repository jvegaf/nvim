return {
  "stevearc/conform.nvim",
  event = "BufReadPre",
  config = function()
    vim.g.disable_autoformat = false
    local lsp_fallback = setmetatable({
      bicep = "always",
    }, {
      -- default true
      __index = function()
        return true
      end,
    })
    require("conform").setup({
      formatters_by_ft = {
        go = { "goimports_reviser", "gofmt", "golines" },
        lua = { "stylua" },
        html = { "prettier" },
        javascript = { "prettier" },
        kotlin = { "ktlint" },
        css = { "prettier" },
        json = { "prettier" },
        ps1 = { "powershell", "trim_whitespace", "trim_newlines" },
        bicep = { "trim_whitespace", "trim_newlines" },
        yaml = { "yamlfmt" },
      },

      format_after_save = function(buf)
        if vim.g.disable_autoformat then
          return
        end
        return {
          lsp_fallback = lsp_fallback[vim.bo[buf].filetype],
        }
      end,

      formatters = {
        goimports_reviser = {
          command = "goimports-reviser",
          args = { "-output", "stdout", "$FILENAME" },
        },
        powershell = {
          command = "pwsh",
          args = {
            "-NoLogo",
            "-NoProfile",
            "-NonInteractive",
            "-Command",
            "(Invoke-Formatter",
            "(Get-Content -Raw -Path",
            "$FILENAME",
            ")).Trim()",
          },
        },
      },
    })

    -- Override stylua's default indent type
    table.insert(require("conform.formatters.stylua").args, "--indent-type")
    table.insert(require("conform.formatters.stylua").args, "Spaces")

    -- Override prettier's default indent type
    table.insert(require("conform.formatters.prettier").args, "--tab-width")
    table.insert(require("conform.formatters.prettier").args, "4")

    -- Toggle format on save
    vim.api.nvim_create_user_command("ConformToggle", function()
      vim.g.disable_autoformat = not vim.g.disable_autoformat
      print("Conform " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
    end, {
      desc = "Toggle format on save",
    })

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })

    -- vim.keymap.set(
    --   "n",
    --   "gq",
    --   "<cmd>lua vim.lsp.buf.format({ async = false, timeout_ms = 10000 })<cr>",
    --   { noremap = true, silent = true, desc = "Format" }
    -- )
    vim.keymap.set("n", "gq", "<cmd>Format<cr>", { noremap = true, silent = true, desc = "Format" })
  end,
}
