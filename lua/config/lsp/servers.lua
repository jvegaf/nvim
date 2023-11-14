-- JAVA
local _jdtls, jdtls = pcall(require, "config.lsp.configs.jdtls")
if _jdtls and type(jdtls) ~= "boolean" then
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "java",
    callback = jdtls.start,
    desc = "Starting Java language server",
  })
end

local lsp_attach = require("config.lsp.attach")

local lsp_flags = {
  debounce_text_changes = 150,
}

local default = function()
  return {
    on_attach = lsp_attach,
    flags = lsp_flags,
  }
end

return {
  -- ["cucumber_language_server"] = function()
  --   return {
  --     on_attach = lsp_attach,
  --     flags = lsp_flags,
  --     settings = {
  --       cucumber = {
  --         features = { "tests/Behat/features/*.feature" },
  --         glue = { "tests/Behat/*.php" },
  --       },
  --     },
  --   }
  -- end,
  ["emmet_ls"] = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    return {
      on_attach = lsp_attach,
      flags = lsp_flags,
      capabilities = capabilities,
      filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "blade",
        "vue",
      },
    }
  end,
  ["html"] = function()
    local config = {
      on_attach = lsp_attach,
      flags = lsp_flags,
    }
    if vim.fn.executable("html-languageserver") == 1 then
      config.cmd = { "html-languageserver", "--stdio" }
    end

    return config
  end,
  ["jsonls"] = function()
    local config = {
      on_attach = lsp_attach,
      flags = lsp_flags,
    }
    if vim.fn.executable("json-languageserver") == 1 then
      config.cmd = { "json-languageserver", "--stdio" }
    end

    return config
  end,
  ["lua_ls"] = function()
    return {
      on_attach = lsp_attach,
      flags = lsp_flags,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
          hint = {
            enable = true,
          },
        },
      },
    }
  end,
  ["tsserver"] = function()
    return {
      on_attach = lsp_attach,
      flags = lsp_flags,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
    }
  end,
  ["jdtls"] = function()
    return {
      on_attach = lsp_attach,
      flags = lsp_flags,
    }
  end,
  ["lemminx"] = function()
    return {
      on_attach = lsp_attach,
      flags = lsp_flags,
    }
  end,
  ["kotlin_language_server"] = function()
    return {
      on_attach = lsp_attach,
      flags = lsp_flags,
    }
  end,
  ["dockerls"] = function()
    return {
      on_attach = lsp_attach,
      flags = lsp_flags,
    }
  end,
  ["docker_compose_language_service"] = function()
    return {
      on_attach = lsp_attach,
      flags = lsp_flags,
    }
  end,
  ["yamlls"] = function()
    return {
      on_attach = lsp_attach,
      flags = lsp_flags,
    }
  end,
}
