-- Set leader key to space
vim.g.mapleader = " "

-- Basic keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit file" })

-- Telescope keys
vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Find Files (Telescope)" })

-- Clear search highlights
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear highlights" })

-- Toggle line wrapping
vim.keymap.set("n", "<leader>tw", ":set wrap!<CR>", { desc = "Toggle wrap" })

-- Open close tree
vim.keymap.set("n", "<leader>e", function()
  local api = require("nvim-tree.api")
  if vim.bo.filetype == "NvimTree" then
    vim.cmd.wincmd("p") -- go to previous window
  else
    api.tree.focus()
  end
end, { desc = "Toggle NvimTree Focus" })
