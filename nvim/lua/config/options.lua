-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Show relative path to file at the top right of the buffer
vim.opt.winbar = "%m %f"

-- Disable autoformat on save
vim.g.autoformat = false

-- Enable switching away from current buffer without saving
-- (This only works if the buffer being switched to already exists)
vim.opt.hidden = true

-- Set blamer date format to mm-dd-yyyy
vim.g.blamer_date_format = "%m-%d-%Y"

-- Turn off relative line number (use `s` to search via leap.nvim instead)
vim.opt.relativenumber = false

-- Enable showing copilot completion when starting a new line
-- (vs. the default of having to type a character first)
vim.g.ai_cmp = false
