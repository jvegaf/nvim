return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  lazy = true,
  opts = function()
    local which_key = require("which-key")
    local setup = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      -- operators = { gc = "Comments" },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<leader>"] = ",",
        ["<leader>"] = "SPC",
        -- ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
      },
      ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = false, -- show help message on the command line when the popup is visible
      -- triggers = "auto", -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
      },
    }

    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    local m_opts = {
      mode = "n", -- NORMAL mode
      prefix = "m",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    local m_mappings = {
      S = { "<cmd>silent BookmarkShowAll<cr>", "Prev" },
      [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
      ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
      [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
      a = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
      b = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
      j = { "<cmd>silent BookmarkNext<cr>", "Next" },
      k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
      m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
      s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
      x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
    }

    local mappings = {
      b = {
        name = "+Buffer",
        b = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "File Browser" },
      },
      c = {
        name = "+Code",
        r = { name = "+Run" },
        s = { name = "+Snippets" },
      },
      B = { name = "Browse" },
      d = { name = "Debug" },
      f = {
        name = "Find",
        c = { "<cmd>lua require('telescope').extensions.changes.changes()<cr>", "Changes" },
        -- C = { "<cmd>Telescope commands<cr>", "Commands" },
        e = { "<cmd>Telescope emoji<cr>", "Find Emoji Symbol" },
        f = { "<cmd>Telescope find_files<cr>", "Find files" },
        h = { "<cmd>Telescope help_tags<cr>", "Help" },
        H = { "<cmd>Telescope highlights<cr>", "Highlights" },
        j = { "<cmd>lua require('telescope.builtin').jumplist()", "Jump List" },
        l = { "<cmd>Telescope resume<cr>", "Last Search" },
        m = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        -- k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        s = { "<cmd>lua require('telescope').extensions.luasnip.luasnip({})<cr>", "Find Snippets" },
        u = { "<cmd>lua require('telescope').extensions.undo.undo()<cr>", "Undo Changes" },
        w = { "<cmd>Telescope live_grep<cr>", "Find Text" },
        y = { "<cmd>lua require('telescope').extensions.yank_history.yank_history()<cr>", "Yank History" },
      },
      g = {
        name = "Git",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = {
          name = "Diff",
          c = { "<cmd>DiffviewClose<cr>", "Close" },
          f = { "<cmd>DiffviewFileHistory %<cr>", "File History" },
          l = { "<cmd>DiffviewGitLog<cr>", "Git Log" },
        },
        e = { "<cmd>lua require'telescope.builtin'.symbols{ sources = { 'gitmoji'} }<cr>", "GitMojis 🤪" },
        g = { "<cmd>LazyGit<cr>", "Lazygit" },
        h = {
          name = "Signs",
          s = { "<cmd>lua require('gitsigns').stage_buffer()<cr>", "Stage Buffer" },
          u = { "<cmd>lua require('gitsigns').undo_stage_buffer()<cr>", "Undo Stage Buffer" },
          -- r = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", "Reset Buffer" },
          p = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview Hunk" },
          b = { "<cmd>lua require('gitsigns').blame_line()<cr>", "Blame Line" },
          j = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "Next Hunk" },
          k = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", "Prev Hunk" },
          h = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "Undo Stage Hunk" },
          l = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
          r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
          v = { "<cmd>lua require('gitsigns').select_hunk()<cr>", "Select Hunk" },
        },
      },
      l = {
        name = "LSP",
        c = { "<cmd>lua require('user.lsp').server_capabilities()<cr>", "Get Capabilities" },
        d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        o = { "<cmd>SymbolsOutline<cr>", "Outline" },
        q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
        R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
        t = {
          name = "Toggle",
          f = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
          h = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle Hints" },
          i = { "<cmd>IlluminateToggle<cr>", "Toggle Doc HL" },
          v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual Text" },
        },
        u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
      },
      r = { name = "Refactor" },
      s = {
        name = "System",
        c = { "<cmd>e $MYVIMRC<cr>", "Config" },
        d = { "<cmd>Alpha<cr>", "Dashboard" },
        h = { "<cmd>checkhealth<cr>", "Check health" },
        l = { "<cmd>Lazy<cr>", "Lazy" },
        m = { "<cmd>Mason<cr>", "Mason" },
        M = { "<cmd>messages<cr>", "Messages" },
        n = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "Notifications" },
      },
      t = {
        name = "Treesitter",
        h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
        p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
        r = { "<cmd>TSToggle rainbow<cr>", "Rainbow" },
      },
      u = {
        name = "UI",
        b = { ':exec &bg=="light"? "set bg=dark" : "set bg=light"<cr>', "Toggle Background" },
        c = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", "Color Theme" },
      },
      x = {
        name = "Diagnostics",
        a = { "<cmd>CodeActionMenu<cr>", "Code Action Menu" },
        c = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Actions" },
        j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", "Next Diagnostic" },
        k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Prev Diagnostic" },
        x = { "<cmd>TroubleToggle<cr>", "Toggle Diagnostics" },
        w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
      },
    }

    local vopts = {
      mode = "v", -- VISUAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }
    local vmappings = {
      h = {
        name = "+Hunks",
        s = { '<ESC><CMD>lua require("gitsigns").stage_hunk(vim.fn.visualmode())<CR>', "Stage Hunk" },
        r = { '<ESC><CMD>lua require("gitsigns").reset_hunk(vim.fn.visualmode())<CR>', "Reset Hunk" },
      },
      -- z = { "<cmd>TZNarrow<cr>", "Narrow" },
    }

    which_key.setup(setup)
    which_key.register(mappings, opts)
    which_key.register(vmappings, vopts)
    which_key.register(m_mappings, m_opts)
  end,
}
