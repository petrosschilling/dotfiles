-- Auto-reload Lua config on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/.config/nvim/lua/**/*.lua",
  callback = function(args)
    vim.cmd("source " .. args.file)
    vim.notify("Sourced " .. args.file, vim.log.levels.INFO)
  end,
})
