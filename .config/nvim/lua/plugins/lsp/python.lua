local M = {}

local util = require("lspconfig/util")

-- Automatically find virtualenv's Python path
local function get_python_path(workspace)
  local paths = {
    workspace .. "/env/bin/python",
    workspace .. "/.venv/bin/python",
  }

  for _, path in ipairs(paths) do
    if vim.fn.executable(path) == 1 then
      return path
    end
  end

  return vim.fn.exepath("python3") or "python"
end

function M.setup(lspconfig, capabilities)
  lspconfig.pyright.setup({
    capabilities = capabilities,
    root_dir = util.root_pattern("pyproject.toml", "setup.py", "requirements.txt", ".git"),
    before_init = function(_, config)
      config.settings = {
        python = {
          pythonPath = get_python_path(config.root_dir),
        },
      }
    end,
  })
end

return M
