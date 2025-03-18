-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-------------------------------------
-- Add line length limit guides
-------------------------------------

-- Set colorcolumn=72 for git commit messages
vim.api.nvim_create_autocmd("BufRead", {
  pattern = "COMMIT_EDITMSG",
  callback = function()
    vim.opt_local.colorcolumn = "72"
  end,
})

-- Set colorcolumn=80 for Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.colorcolumn = "80"
  end,
})
