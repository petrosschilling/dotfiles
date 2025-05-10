local kanagawa = {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      -- theme = "dragon",
      styles = {
        bold = false,
        italic = false,
        transparency = false,
      },
    })
    vim.cmd.colorscheme("kanagawa")
  end,
}

return kanagawa
