local telescope = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        layout_config = {
          horizontal = { width = 0.9 },
        },
        sorting_strategy = "ascending",
        prompt_prefix = "   ",
        selection_caret = " ",
      },
    })
    pcall(telescope.load_extension, "fzf")
  end,
  cmd = "Telescope",
}

return telescope
