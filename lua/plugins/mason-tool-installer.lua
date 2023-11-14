return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",
  dependencies = { "williamboman/mason.nvim" },
  cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
  opts = {
    ensure_installed = {
      "clang-format",
      "eslint_d",
      "jq",
      "java-debug-adapter",
      "java-test",
      "google-java-format",
      "ktlint",
      "prettierd",
      "shellcheck",
      "shfmt",
      "stylua",
      "yamlfmt",
      "yamllint",
    },
    auto_update = true,
  },
}
