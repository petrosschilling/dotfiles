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
  { "williamboman/mason.nvim", build = ":MasonUpdate" },
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "1a31f82", -- v1.32.0
    dependencies = { "williamboman/mason.nvim" },
  },
  { "neovim/nvim-lspconfig" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  require("plugins.telescope"),
  require("plugins.tmux"),
  require("plugins.theme"), -- Color theme

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Formatter integration
  {
    "stevearc/conform.nvim",
    opts = {},
    event = "BufWritePre",
    config = function()
      require("plugins.format")
    end,
  },

  -- Mason integration for conform (auto-installs formatters)
  {
    "zapling/mason-conform.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "stevearc/conform.nvim",
    },
    config = function()
      require("mason-conform").setup({
        ensure_installed = { "prettier", "stylua" }, -- ✅ Auto-installs formatters
      })
    end,
  },

  -- Auto complete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP completions
      "hrsh7th/cmp-buffer", -- Words from current buffer
      "hrsh7th/cmp-path", -- Filesystem paths
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- LuaSnip integration
    },
    event = "InsertEnter",
    config = function()
      require("plugins.cmp")
    end,
  },

  -- Directory tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
    version = "*",
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  -- Directory tree icons
  { "nvim-tree/nvim-web-devicons" },
})
