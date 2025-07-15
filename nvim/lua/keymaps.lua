-- [[ Basic Keymaps ]]
-- To see where a keymap is defined or whether it exists, use `:FzfLua keymaps<cr>`
-- This files contains only non-plugin keymaps

local map = vim.keymap.set

map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy menu' })
map('n', '<leader>r', '<cmd>e #<cr>', { desc = 'Recent buffer' })
map('n', '<leader>|', '<C-W>v', { desc = 'Split window right', remap = true })
map('n', '<leader>-', '<C-W>s', { desc = 'Split window below', remap = true })

map('n', '<leader>a', '<Nop>', { desc = 'AI' })
map('n', '<leader>ao', function()
  local cwd = vim.fn.getcwd()
  local cmd = 'open -a Cursor ' .. cwd
  vim.fn.system(cmd)
end, { desc = 'Open in Cursor' })

map('n', '<leader>c', '<Nop>', { desc = 'Code' })
map('n', '<leader>cm', '<cmd>Mason<cr>', { desc = 'Mason menu' })

map('n', '<leader>t', '<Nop>', { desc = 'Toggle' })
map('n', '<leader>tw', '<cmd>set wrap!<cr>', { desc = 'Wrap line' })
map('n', '<leader>td', vim.diagnostic.open_float, { desc = 'Diagnostics popup' })
map('n', '<leader>tr', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
  vim.notify('Relative line numbers: ' .. (vim.wo.relativenumber and 'on' or 'off'), vim.log.levels.INFO)
end, { desc = 'Relative line numbers' })

----------------------------------------------------------------------------------------------------
-- Git keymaps
----------------------------------------------------------------------------------------------------

map('n', '<leader>g', '<Nop>', { desc = 'Git' })

local function git_open_remote(remote)
  local cur_win = vim.api.nvim_get_current_win()
  vim.system({ 'git', 'open', remote }, { text = true }, function(obj)
    vim.schedule(function()
      if obj.code ~= 0 then
        vim.notify('git open ' .. remote .. ' failed:\n' .. obj.stderr, vim.log.levels.ERROR)
      end
      if vim.api.nvim_win_is_valid(cur_win) then
        vim.api.nvim_set_current_win(cur_win)
      end
    end)
  end)
end

map('n', '<leader>gr', function() -- [r]emote
  git_open_remote 'origin'
end, { desc = 'Browse origin' })

map('n', '<leader>gR', function()
  git_open_remote 'upstream'
end, { desc = 'Browse upstream' })

----------------------------------------------------------------------------------------------------
-- Copy to clipboard keymaps
----------------------------------------------------------------------------------------------------

map('n', '<leader>C', '<Nop>', { desc = 'Copy to clipboard' })

local function copy_full_path()
  local full_path = vim.fn.expand '%:p'
  vim.fn.setreg('+', full_path)
  print('Copied: ' .. full_path)
end

local function copy_rel_path()
  local rel_path = vim.fn.expand '%:.'
  vim.fn.setreg('+', rel_path)
  print('Copied: ' .. rel_path)
end

local function copy_file_name()
  local filename = vim.fn.expand '%:t'
  vim.fn.setreg('+', filename)
  print('Copied: ' .. filename)
end

map('n', '<leader>Ca', copy_full_path, { noremap = true, silent = true, desc = 'Absolute file path' })
map('n', '<leader>Cr', copy_rel_path, { noremap = true, silent = true, desc = 'Relative file path' })
map('n', '<leader>Cf', copy_file_name, { noremap = true, silent = true, desc = 'File name' })

----------------------------------------------------------------------------------------------------
-- Saner defaults
----------------------------------------------------------------------------------------------------

-- When text is wrapped, move up/down by display lines, not logical lines
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
-- (See `:help hlsearch`)
map('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- Prevent selection from being reset after indenting in visual mode, allowing indenting multiple
-- times without reselecting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- n always searches forward and N backward, instead of depending on whether / or ? was used
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', function()
  return vim.v.searchforward == 1 and 'nzzzv' or 'Nzzzv'
end, { expr = true, desc = 'Next search result' })
map('x', 'n', "'Nn'v:searchforward", { expr = true })
map('o', 'n', "'Nn'v:searchforward", { expr = true })
map('n', 'N', function()
  return vim.v.searchforward == 1 and 'Nzzzv' or 'nzzzv'
end, { expr = true, desc = 'Prev search result' })
map('x', 'N', "'nN'v:searchforward", { expr = true })
map('o', 'N', "'nN'v:searchforward", { expr = true })

----------------------------------------------------------------------------------------------------
-- Buffers
----------------------------------------------------------------------------------------------------

-- Ctrl+s to save the current buffer
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>')

-- Ctrl+q to delete the current buffer
map('n', '<C-q>', '<cmd>bd<cr>')
map('t', '<C-q>', '<cmd>q!<cr>')

-- Shift+<hl> to switch between adjacent buffers
map('n', '<S-h>', '<cmd>bprevious<cr>')
map('n', '<S-l>', '<cmd>bnext<cr>')

----------------------------------------------------------------------------------------------------
-- Split windows
----------------------------------------------------------------------------------------------------

-- Ctrl+<hjkl> to switch between split windows
-- (See `:help wincmd` for all window commands)
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')

-- Ctrl+<arrow> to resize the current split window
map('n', '<C-Up>', '<cmd>resize +2<cr>')
map('n', '<C-Down>', '<cmd>resize -2<cr>')
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>')
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>')

----------------------------------------------------------------------------------------------------
-- Terminal
----------------------------------------------------------------------------------------------------

-- Ctrl+/ to toggle the same, single terminal buffer
-- Note: this keeps terminal usage inside NeoVim simple. More complex terminal management should be
-- done in a separate Ghostty tab/window
local terminal_bufnr = nil
local terminal_winid = nil
local function toggle_terminal()
  -- If terminal is open, close it
  if terminal_winid and vim.api.nvim_win_is_valid(terminal_winid) then
    vim.api.nvim_win_close(terminal_winid, true)
    terminal_winid = nil
  else
    -- If terminal buffer doesn't exist or is invalid, create a new one
    if not terminal_bufnr or not vim.api.nvim_buf_is_valid(terminal_bufnr) then
      vim.cmd 'botright new'
      vim.cmd 'resize 10'
      vim.cmd 'terminal'
      terminal_bufnr = vim.api.nvim_get_current_buf()
      terminal_winid = vim.api.nvim_get_current_win()
      vim.cmd 'startinsert'
    else
      -- Reopen the existing terminal buffer in a new split
      vim.cmd('botright sbuffer ' .. terminal_bufnr)
      vim.cmd 'resize 10'
      terminal_winid = vim.api.nvim_get_current_win()
      vim.cmd 'startinsert'
    end
  end
end
map({ 't', 'n' }, '<C-/>', function()
  toggle_terminal()
end, { noremap = true, silent = true })

-- Exit terminal mode with <Esc> and return to normal mode
map('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
