-- [[ Basic Keymaps ]]
-- To see where a keymap is defined or whether it exists, use `:FzfLua keymaps<cr>`

----------------------------------------------------------------------------------------------------
-- which-key.nvim
----------------------------------------------------------------------------------------------------

-- Root level
vim.keymap.set('n', '<leader>C', '<cmd>Lazy<cr>', { desc = '[C]opy to clipboard' })
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = '[L]azy' })
vim.keymap.set('n', '<leader>r', '<cmd>e #<cr>', { desc = '[R]ecent buffer' })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })

-- Groupings
vim.keymap.set("n", "<leader>a", "<Nop>", { desc = "[A]I" })
vim.keymap.set("n", "<leader>c", "<Nop>", { desc = "[C]ode" })
vim.keymap.set("n", "<leader>g", "<Nop>", { desc = "[G]it" })
vim.keymap.set("n", "<leader>s", "<Nop>", { desc = "[S]earch" })
vim.keymap.set("n", "<leader>t", "<Nop>", { desc = "[T]oggle" })

-- AI
vim.keymap.set("n", "<leader>ar", function()
  local cwd = vim.fn.getcwd()
  local cmd = "open -a Cursor " .. cwd
  vim.fn.system(cmd)
end, { desc = "Cu[r]sor: open cwd" })


-- Toggle
vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<cr>', { desc = '[W]rap line' })

----------------------------------------------------------------------------------------------------
-- Copy to clipboard
----------------------------------------------------------------------------------------------------

vim.api.nvim_create_user_command("CopyFullPath", function()
  local full_path = vim.fn.expand("%:p") -- Get full file path
  vim.fn.setreg("+", full_path) -- Copy to system clipboard
  print("Copied: " .. full_path) -- Optional: Display message
end, {})
vim.keymap.set(
  "n",
  "<leader>Ca",
  ":CopyFullPath<CR>",
  { noremap = true, silent = true, desc = "[A]bsolute file path" }
)

vim.api.nvim_create_user_command("CopyRelPath", function()
  local rel_path = vim.fn.expand("%:.") -- Get relative file path
  vim.fn.setreg("+", rel_path) -- Copy to system clipboard
  print("Copied: " .. rel_path) -- Optional: Display message
end, {})
vim.keymap.set(
  "n",
  "<leader>Cr",
  ":CopyRelPath<CR>",
  { noremap = true, silent = true, desc = "[R]elative file path" }
)

vim.keymap.set(
  "n",
  "<leader>Cn",
  ":!echo %:t | pbcopy<CR>",
  { noremap = true, silent = true, desc = "File [n]ame" }
)

----------------------------------------------------------------------------------------------------
-- Saner defaults
----------------------------------------------------------------------------------------------------

-- When text is wrapped, move up/down by display lines, not logical lines
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
-- (See `:help hlsearch`)
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- Prevent selection from being reset after indenting in visual mode, allowing indenting multiple
-- times without reselecting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- n always searches forward and N backward, instead of depending on whether / or ? was used
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

----------------------------------------------------------------------------------------------------
-- Shortcuts
----------------------------------------------------------------------------------------------------

-- Ctrl+s to save the current buffer
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>')

-- Ctrl+q to delete the current buffer
vim.keymap.set('n', '<C-q>', '<cmd>bd<cr>')

-- Shift+<hl> to switch between adjacent buffers
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>')

-- Ctrl+<hjkl> to switch between split windows
-- (See `:help wincmd` for all window commands)
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')

-- Ctrl+<arrow> to resize the current split window
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- Alt+<up/down> to move the current line/selection
vim.keymap.set("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==")
vim.keymap.set("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==")
vim.keymap.set("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv")
vim.keymap.set("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv")
vim.keymap.set("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi")
vim.keymap.set("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi")
