-- Show line numbers
vim.opt.number = true         -- Show absolute line number on the current line
vim.opt.relativenumber = true -- Show relative line numbers on all other lines

-- Tabs & indentation
vim.opt.tabstop = 2      -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2   -- Number of spaces used for autoindent
vim.opt.expandtab = true -- Use spaces instead of actual tab characters

-- Colors
vim.cmd.colorscheme("default")

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Use system clipboard by default

-- Mouse
vim.opt.mouse = "a" -- Enable mouse support in all modes

vim.opt.updatetime = 1000;

-- Show invisible characters
vim.opt.list = true -- Enable displaying special whitespace chars
vim.opt.listchars = {
  --space = ".",                        -- Show middle dot for spaces
  tab = "→ ", -- Show arrow for tab characters
  trail = "·", -- Show dot for trailing spaces
}

-- Others (optional, tweak later)
vim.opt.wrap = false         -- Disable line wrapping
vim.opt.cursorline = true    -- Highlight the current line
vim.opt.termguicolors = true -- Enable true color support (recommended for themes)
vim.opt.scrolloff = 999      -- Keeps cursor vertically centered
vim.opt.splitbelow = true    -- Horizontal splits go below
vim.opt.splitright = true    -- Vertical splits go right
