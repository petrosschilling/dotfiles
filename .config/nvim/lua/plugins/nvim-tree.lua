local function config()
  local api = require("nvim-tree.api")
  local nvim_tree = require("nvim-tree")

  nvim_tree.setup({
    on_attach = function(bufnr)
      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      api.config.mappings.default_on_attach(bufnr)

      -- rebind 's' to horizontal split
      vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))

      -- optional: rebind 'v' to vertical split
      vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
    end,
    hijack_netrw = true,
    actions = {
      open_file = {
        quit_on_open = false,
        resize_window = true,
        window_picker = {
          enable = true,
        },
      },
    },
    view = {
      side = "left",
    },
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          folder_arrow = false, -- Disable arrow next to folders
          git = false,
        },
        glyphs = {
          git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "",
            untracked = "",
            deleted = "",
            ignored = "",
          },
        },
      },
    },
    git = {
      enable = true,
      ignore = false,
    },
  })
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
  version = "*",
  config = config,
}
