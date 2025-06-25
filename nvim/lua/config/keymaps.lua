-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- AI
vim.keymap.set("n", "<leader>a", "<Nop>", { desc = "AI" })
-- CodeCompanion
vim.keymap.set("v", "<leader>C", ":'<,'>CodeCompanion", { desc = " CodeCompanion Inline Assistant" })
vim.keymap.set("n", "<leader>ac", ":CodeCompanionChat", { desc = " CodeCompanion Chat" })
-- Copilot
vim.keymap.set("n", "<leader>ap", function()
  if require("copilot.client").is_disabled() then
    require("copilot.command").enable()
  else
    require("copilot.command").disable()
  end
end, { desc = " Toggle Copilot AI" })
-- Cursor
vim.keymap.set("n", "<leader>ar", function()
  local cwd = vim.fn.getcwd()
  local cmd = "open -a Cursor " .. cwd
  vim.fn.system(cmd)
end, { desc = " Open cwd in Cursor" })

-- Copy file path/name to clipboard
vim.api.nvim_create_user_command("CopyFullPath", function()
  local full_path = vim.fn.expand("%:p") -- Get full file path
  vim.fn.setreg("+", full_path) -- Copy to system clipboard
  print("Copied: " .. full_path) -- Optional: Display message
end, {})
vim.keymap.set(
  "n",
  "<leader>f0",
  ":CopyFullPath<CR>",
  { noremap = true, silent = true, desc = "Copy to clipboard: absolute file path" }
)
vim.api.nvim_create_user_command("CopyRelPath", function()
  local rel_path = vim.fn.expand("%:.") -- Get relative file path
  vim.fn.setreg("+", rel_path) -- Copy to system clipboard
  print("Copied: " .. rel_path) -- Optional: Display message
end, {})
vim.keymap.set(
  "n",
  "<leader>f1",
  ":CopyRelPath<CR>",
  { noremap = true, silent = true, desc = "Copy to clipboard: relative file path" }
)
vim.keymap.set(
  "n",
  "<leader>f2",
  ":!echo %:t | pbcopy<CR>",
  { noremap = true, silent = true, desc = "Copy to clipboard: file name" }
)

-- Escape toggleterm's Terminal mode (in order to split with 2 + Ctrl + /)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- Toggle cursor centering
vim.keymap.set("n", "<leader>uo", function()
  vim.opt.scrolloff = 999 - vim.o.scrolloff
end, { nowait = true, desc = "Toggle Cursor Centering" })

-- Toggle virtual lines for diagnostics
vim.keymap.set("n", "<leader>xv", function()
  local config = vim.diagnostic.config() or {}
  vim.diagnostic.config({ virtual_lines = not config.virtual_lines })
end, { desc = "Toggle Virtual Lines" })

-- Delete all buffers
vim.keymap.set("n", "<leader>ba", ":%bd<CR>", { desc = "Delete All Buffers" })
