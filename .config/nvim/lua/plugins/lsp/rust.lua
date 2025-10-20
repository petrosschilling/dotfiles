local M = {}

local util = require("lspconfig/util")

function M.setup(lspconfig, capabilities)
  lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    root_dir = util.root_pattern("Cargo.toml", ".git"),
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true, buildScripts = { enable = true } },
        check = { command = "clippy" },
        procMacro = { enable = true },
        imports = {
          granularity = { group = "module" },
          prefix = "crate",
        },
        -- lens = { enable = true },
        hover = { actions = { enable = true } },
        files = { excludeDirs = { ".git", "target", "node_modules" } },
        workspace = { symbol = { search = { kind = "all_symbols", limit = 1024 } } },
        rustfmt = { rangeFormatting = { enable = true } },
      },
    },
    on_attach = function(client, bufnr)
      require("plugins.lsp.keymaps").setup(client, bufnr)
    end,
  })
end

return M
