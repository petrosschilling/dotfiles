local function config()
  local mason = require("mason")
  mason.setup()

  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup({
    automatic_installation = true,
    ensure_installed = {
      "lua_ls",
      "ts_ls",
      "pyright",
      "rust_analyzer",
      "glsl_analyzer",
    },
  })

  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- Load language-specific configurations
  local lsp_python = require("plugins.lsp.python")
  lsp_python.setup(lspconfig, capabilities)

  local lsp_lua = require("plugins.lsp.lua")
  lsp_lua.setup(lspconfig, capabilities)

  local lsp_rust = require("plugins.lsp.rust")
  lsp_rust.setup(lspconfig, capabilities)

  local keymaps = require("plugins.lsp.keymaps")

  -- Setup other LSP servers
  mason_lspconfig.setup_handlers({
    function(server_name)
      if server_name ~= "lua_ls" and server_name ~= "pyright" and server_name ~= "rust_analyzer" then
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = keymaps.setup,
        })
      end
    end,
  })
end
config()
-- return {
--   "williamboman/mason.nvim",
--   "williamboman/mason-lspconfig.nvim",
--   "neovim/nvim-lspconfig",
--   config = config,
-- }

-- return {
--   { "williamboman/mason.nvim", build = ":MasonUpdate" },
--   {
--     "williamboman/mason-lspconfig.nvim",
--     commit = "1a31f82", -- v1.32.0
--     dependencies = { "williamboman/mason.nvim" },
--   },
--   { "neovim/nvim-lspconfig" },
--   config = config
-- }
