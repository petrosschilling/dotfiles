require("nvim-tree").setup({
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
        folder_arrow = false, -- ✅ Disable arrow next to folders
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
