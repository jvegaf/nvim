require("mason").setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    "angularls",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "emmet_ls",
    "html",
    "jdtls",
    "jsonls",
    "kotlin_language_server",
    "lemminx",
    "lua_ls",
    "ruff_lsp",
    "tsserver",
    "yamlls",
  }
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "black",
    "debugpy",
    "pyright",
    "clang-format",
    "eslint_d",
    "google-java-format",
    "java-debug-adapter",
    "java-test",
    "jq",
    "js-debug-adapter",
    "ktlint",
    "prettierd",
    "shellcheck",
    "shfmt",
    "stylua",
    "yamlfmt",
    "yamllint",
  },
  auto_update = true,
})
