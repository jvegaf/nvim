return {
  "akinsho/nvim-toggleterm.lua",
  lazy = false,
  branch = "main",
  keys = {
    { "<A-1>", "<Cmd>1ToggleTerm direction=vertical size=80<Cr>", desc = "Terminal #1", mode = { "t", "n" } },
    { "<A-2>", "<Cmd>2ToggleTerm<Cr>", desc = "Terminal #2", mode = { "t", "n" } },
    { "<A-3>", "<Cmd>3ToggleTerm direction=horizontal<Cr>", desc = "Terminal #3", mode = { "t", "n" } },
  },
  config = function()

    local flatten = {
      "willothy/flatten.nvim",
      opts = function()
        ---@type Terminal?
        local saved_terminal

        return {
          window = {
            open = "alternate",
          },
          callbacks = {
            should_block = function(argv)
              -- Note that argv contains all the parts of the CLI command, including
              -- Neovim's path, commands, options and files.
              -- See: :help v:argv

              -- In this case, we would block if we find the `-b` flag
              -- This allows you to use `nvim -b file1` instead of
              -- `nvim --cmd 'let g:flatten_wait=1' file1`
              return vim.tbl_contains(argv, "-b")

              -- Alternatively, we can block if we find the diff-mode option
              -- return vim.tbl_contains(argv, "-d")
            end,
            pre_open = function()
              local term = require("toggleterm.terminal")
              local termid = term.get_focused_id()
              saved_terminal = term.get(termid)
            end,
            post_open = function(bufnr, winnr, ft, is_blocking)
              if is_blocking and saved_terminal then
                -- Hide the terminal while it's blocking
                saved_terminal:close()
              else
                -- If it's a normal file, just switch to its window
                vim.api.nvim_set_current_win(winnr)

                -- If we're in a different wezterm pane/tab, switch to the current one
                -- Requires willothy/wezterm.nvim
                require("wezterm").switch_pane.id(tonumber(os.getenv("WEZTERM_PANE")))
              end

              -- If the file is a git commit, create one-shot autocmd to delete its buffer on write
              -- If you just want the toggleable terminal integration, ignore this bit
              if ft == "gitcommit" or ft == "gitrebase" then
                vim.api.nvim_create_autocmd("BufWritePost", {
                  buffer = bufnr,
                  once = true,
                  callback = vim.schedule_wrap(function()
                    vim.api.nvim_buf_delete(bufnr, {})
                  end),
                })
              end
            end,
            block_end = function()
              -- After blocking ends (for a git commit, etc), reopen the terminal
              vim.schedule(function()
                if saved_terminal then
                  saved_terminal:open()
                  saved_terminal = nil
                end
              end)
            end,
          },
        }
      end,
    }

    local is_win = vim.loop.os_uname().sysname == "Windows_NT"

    if is_win then
      local powershell_options = {
        shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
        shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
        shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
        shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
        shellquote = "",
        shellxquote = "",
      }

      for option, value in pairs(powershell_options) do
        vim.opt[option] = value
      end
    end

    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<A-0>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      winbar = {
        enabled = true,
      },
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })
  end,
}
