local M = {}

function M.setup(lspconfig, capabilities)
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
end

return M
