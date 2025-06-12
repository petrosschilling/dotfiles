local function config()
  local mason_conform = require("mason-conform")
  mason_conform.setup({
    ensure_installed = { "prettier", "stylua" }, -- Auto-installs formatters
  })
end

return {
  "zapling/mason-conform.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "stevearc/conform.nvim",
  },
  config = config
}
