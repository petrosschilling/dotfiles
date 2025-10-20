-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", build = ":MasonUpdate" },
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "1a31f82", -- v1.32.0
    dependencies = { "williamboman/mason.nvim" },
  },
  require("plugins.telescope"),
  require("plugins.theme"),
  -- require("plugins.lsp"),
  require("plugins.treesitter"),
  require("plugins.lualine"),
  require("plugins.nvim-tree"),
  require("plugins.cmp"),
  require("plugins.conform"),
  require("plugins.mason-conform"),
  { "onsails/lspkind.nvim" },
  { "christoomey/vim-tmux-navigator" },
  { "nvim-tree/nvim-web-devicons" },
})

require("plugins.lsp")

-- remove the italics for god sake
vim.cmd("highlight Keyword cterm=NONE gui=NONE")
