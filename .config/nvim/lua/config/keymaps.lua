-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>a", "<Nop>", { desc = "AI Assistant" })
vim.keymap.set("v", "<leader>a", "<Nop>", { desc = "AI Assistant" })
-- Avante
vim.keymap.set("n", "<leader>as", "<Nop>", { desc = "avante: switch provider" })
vim.keymap.set("n", "<leader>aso", ":AvanteSwitchProvider openai", { noremap = true, silent = true, desc = "OpenAI GPT-4.o" })
vim.keymap.set("n", "<leader>asc", ":AvanteSwitchProvider claude", { noremap = true, silent = true, desc = "Claude 3.5 Sonnet" })
vim.keymap.set("n", "<leader>asd", ":AvanteSwitchProvider ollama", { noremap = true, silent = true, desc = "DeepSeek Coder v2" })
-- Copilot toggle
vim.keymap.set("n", "<leader>ac", function()
  if require("copilot.client").is_disabled() then
    require("copilot.command").enable()
  else
    require("copilot.command").disable()
  end
end, { desc = "copilot: toggle" })

-- Copy file path to clipboard (relative)
vim.api.nvim_create_user_command("CopyRelPath", function()
  local rel_path = vim.fn.expand("%:.") -- Get relative file path
  vim.fn.setreg("+", rel_path) -- Copy to system clipboard
  print("Copied: " .. rel_path) -- Optional: Display message
end, {})
vim.keymap.set(
  "n",
  "<leader>fp",
  ":CopyRelPath<CR>",
  { noremap = true, silent = true, desc = "pbcopy RELATIVE File Path" }
)

-- Copy file path to clipboard (absolute)
vim.api.nvim_create_user_command("CopyFullPath", function()
  local full_path = vim.fn.expand("%:p") -- Get full file path
  vim.fn.setreg("+", full_path) -- Copy to system clipboard
  print("Copied: " .. full_path) -- Optional: Display message
end, {})
vim.keymap.set("n", "<leader>fP", ":CopyFullPath<CR>", { noremap = true, silent = true, desc = "pbcopy ABSOLUTE File Path" })

-- Copy current file name to clipboard
vim.keymap.set("n", "<leader>fm", ":!echo %:t | pbcopy<CR>", { noremap = true, silent = true, desc = "pbcopy File Name" })

-- Copy visually highlighted text to clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copy to Clipboard" })

-- Escape toggleterm's Terminal mode (in order to split with 2 + Ctrl + /)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- Toggle git blame via Blamer.nvim
vim.keymap.set("n", "<leader>cb", ":BlamerToggle<CR>", { noremap = true, silent = true, desc = "Toggle blame message (blamer.nvim)" })

-- Toggle inline diagnostics via lsp_lines.nvim
vim.keymap.set("", "<leader>xv", require("lsp_lines").toggle, { desc = "Toggle inline diagnostics (lsp_lines.nvim)" })

-- Open Neotree position for the current Nvim session
vim.keymap.set("n", "<leader>fw", "<Nop>", { desc = "Open Neotree by position" })
vim.keymap.set("n", "<leader>fwf", ":Neotree position=float<CR>", { noremap = true, silent = true, desc = "Float (default)" })
vim.keymap.set("n", "<leader>fwl", ":Neotree position=left<CR>", { noremap = true, silent = true, desc = "Left" })
vim.keymap.set("n", "<leader>fwr", ":Neotree position=right<CR>", { noremap = true, silent = true, desc = "Right" })
vim.keymap.set("n", "<leader>fwu", ":Neotree position=current<CR>", { noremap = true, silent = true, desc = "Full" })
