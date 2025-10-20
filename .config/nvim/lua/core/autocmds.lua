-- Set 2-space indentation for Rust files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- Auto-reload Lua config on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/.config/nvim/lua/**/*.lua",
  callback = function(args)
    vim.cmd("source " .. args.file)
    vim.notify("Sourced " .. args.file, vim.log.levels.INFO)
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.vert", "*.frag", "*.geom", "*.glsl" },
  callback = function()
    vim.bo.filetype = "glsl"
  end,
})


-- Improved: Only show diagnostic float if cursor hasn't moved since last CursorHold
local last_float = { buf = nil, pos = nil }
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local pos = vim.api.nvim_win_get_cursor(0)
    if not (last_float.buf == buf and last_float.pos and last_float.pos[1] == pos[1] and last_float.pos[2] == pos[2]) then
      vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
      last_float = { buf = buf, pos = { pos[1], pos[2] } }
    end
  end,
})
vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    last_float = { buf = nil, pos = nil }
  end,
})
