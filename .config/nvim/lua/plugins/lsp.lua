require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = { "lua_ls", "pyright" },
  ensure_installed = { "lua_ls", "pyright" },
})

local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})
lspconfig.lua_ls.setup({})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
  function(server_name)
    if server_name == "lua_ls" then
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        root_dir = function()
          return vim.loop.cwd()
        end,
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
    else
      lspconfig[server_name].setup({})
    end
  end,
})
