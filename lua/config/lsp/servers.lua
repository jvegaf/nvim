-- JAVA
local lspconfig = require("lspconfig")
local lsp_attach = require("config.lsp.attach")

local capabilities = require("config.lsp.handlers").capabilities

local lsp_flags = {
  debounce_text_changes = 150,
}

local default = function()
  return {
    on_attach = lsp_attach,
    flags = lsp_flags,
  }
end

lspconfig.emmet_ls.setup {
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

lspconfig.html.setup {
  on_attach = lsp_attach,
  flags = lsp_flags,
}

lspconfig.jsonls.setup {
  on_attach = lsp_attach,
  flags = lsp_flags,
}

lspconfig.lemminx.setup {
  on_attach = lsp_attach,
  flags = lsp_flags,
}

lspconfig.kotlin_language_server.setup {
  on_attach = lsp_attach,
  flags = lsp_flags,
}

lspconfig.dockerls.setup {
  on_attach = lsp_attach,
  flags = lsp_flags,
}


lspconfig.docker_compose_language_service.setup {
  on_attach = lsp_attach,
  flags = lsp_flags,
}

lspconfig.yamlls.setup {
  on_attach = lsp_attach,
  flags = lsp_flags,
}

lspconfig.lua_ls.setup {
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

lspconfig.tsserver.setup {
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

lspconfig.pyright.setup {
  on_attach = lsp_attach,
  flags = lsp_flags,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic", -- off, basic, strict
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
        diagnosticMode = "workspace",
        -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
        diagnosticSeverityOverrides = {
          strictListInference = true,
          strictDictionaryInference = true,
          strictSetInference = true,
          reportUnusedImport = "warning",
          reportUnusedClass = "warning",
          reportUnusedFunction = "warning",
          reportUnusedVariable = "warning",
          reportUnusedCoroutine = "warning",
          reportDuplicateImport = "warning",
          reportPrivateUsage = "warning",
          reportUnusedExpression = "warning",
          reportConstantRedefinition = "error",
          reportIncompatibleMethodOverride = "error",
          reportMissingImports = "error",
          reportUndefinedVariable = "error",
          reportAssertAlwaysTrue = "error",
        },
      },
    },
  }, }
