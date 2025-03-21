-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-------------------------------------
-- Add line length limit guides
-------------------------------------

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "COMMIT_EDITMSG",
  callback = function()
    vim.opt_local.colorcolumn = "72"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.colorcolumn = "80"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.opt_local.colorcolumn = "110"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescript",
  callback = function()
    vim.opt_local.colorcolumn = "110"
  end,
})
