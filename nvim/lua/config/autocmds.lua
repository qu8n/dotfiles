-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

----------------------------------------------------------------------------------------------------
-- Add "colorcolumn", vertical lines that serve as visual guides for line length
--
-- NOTE: many languages don't have an agreed-upon line length. The legacy convention was 80, when
-- programs were written on punch cards. With today's wide screens, many recommend 100 and 120 as
-- the soft and hard limits, respectively
----------------------------------------------------------------------------------------------------

-- Override the default, which looks too light for the black background
vim.api.nvim_command("highlight ColorColumn guibg=#282828")

-- Set specific colorcolumns based on filetype
local colorcolumn_by_filetype = {
  markdown = "80", -- conventional limit
  python = "88", -- Black's default
}

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local col = colorcolumn_by_filetype[args.match]
    if col then
      vim.opt_local.colorcolumn = col
    else
      -- By default, set two colorcolumns at 100 and 120 characters
      vim.opt_local.colorcolumn = "100,120"
    end
  end,
})

-- Set special guides for the commit message buffer that opens when running `git commit` without `-m`
-- The recommended lengths are 50 and 72 for the git commit message and body, respectively
vim.api.nvim_create_autocmd("BufRead", {
  pattern = "COMMIT_EDITMSG",
  callback = function()
    vim.opt_local.colorcolumn = "50, 72"
  end,
})
