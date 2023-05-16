return {
  "shuntaka9576/preview-swagger.nvim",
  cmd = "SwaggerPreview",
  build = "yarn install",
  keys = { { "<leader>uS", "<cmd>SwaggerPreview<CR>", desc = "Open Swagger Preview" } },
}
