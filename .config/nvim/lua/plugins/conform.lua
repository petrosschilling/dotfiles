local function config()
  local conform = require("conform")

  conform.setup({
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      markdown = { "prettier" },
      yaml = { "prettier" },
      rust = { "rustfmt" },
    },
    formatters = {
      stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
      rustfmt = {
        -- Use project rustfmt.toml if present; no extra args needed by default
        inherit = true,
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  })
end

return {
  "stevearc/conform.nvim",
  opts = {},
  event = "BufWritePre",
  config = config,
}
