local function config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "python",
      "bash",
      "json",
      "markdown",
      "html",
      "css",
    },

    highlight = {
      enable = true, -- Use Tree-sitter for syntax highlighting
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = true, -- May not work perfectly for all languages
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = config
}
