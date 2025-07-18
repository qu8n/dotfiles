-- [[ Basic Keymaps ]]
-- To see where a keymap is defined or whether it exists, use `:FzfLua keymaps<cr>`
-- This files contains only non-plugin keymaps

local map = vim.keymap.set

map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })
map('n', '<leader>r', '<cmd>e #<cr>', { desc = 'Recent buffer' })
map('n', '<leader>|', '<C-W>v', { desc = 'Split window →', remap = true })
map('n', '<leader>-', '<C-W>s', { desc = 'Split window ↓', remap = true })

----------------------------------------------------------------------------------------------------
-- AI keymaps
----------------------------------------------------------------------------------------------------

map('n', '<leader>a', '<Nop>', { desc = 'AI' })

map('n', '<leader>ar', function()
  local cwd = vim.fn.getcwd()
  local cmd = 'open -a Cursor ' .. cwd
  vim.fn.system(cmd)
end, { desc = 'Open in Cursor' })

----------------------------------------------------------------------------------------------------
-- Code keymaps
----------------------------------------------------------------------------------------------------

map({ 'n', 'v' }, '<leader>c', '<Nop>', { desc = 'Code' })

map('n', '<leader>cm', '<cmd>Mason<cr>', { desc = 'Mason' })

-- Table mapping file extensions to their log/print statement formats
local log_statements_by_language = {
  ['.js'] = 'console.log("%s:", %s);',
  ['.ts'] = 'console.log("%s:", %s);',
  ['.tsx'] = 'console.log("%s:", %s);',
  ['.py'] = 'print("%s: ", %s)',
  ['.java'] = 'System.out.println("%s: " + %s);',
}
local function add_log()
  -- Get the variable name under the cursor
  local var_name = vim.fn.expand '<cword>'
  local row = vim.api.nvim_win_get_cursor(0)[1]
  -- Get buffer name and file extension
  local bufname = vim.api.nvim_buf_get_name(0)
  local ext = bufname:match '^.+(%.[^%.]+)$' or ''
  -- Reference the print statement table
  local log_template = log_statements_by_language[ext]
  if not log_template then
    vim.api.nvim_echo({ { 'Unsupported file extension: ' .. ext, 'ErrorMsg' } }, false, {})
    return
  end
  local log_line = string.format(log_template, var_name, var_name)
  -- Find next empty line after cursor
  local lines = vim.api.nvim_buf_get_lines(0, row, -1, false)
  local insert_row = row
  for i, l in ipairs(lines) do
    if l:match '^%s*$' then
      insert_row = row + i
      break
    end
  end
  -- Insert log line and an empty line
  vim.api.nvim_buf_set_lines(0, insert_row, insert_row, false, { log_line, '' })
  -- Save original cursor position
  local orig_pos = vim.api.nvim_win_get_cursor(0)
  -- Move cursor to the inserted log line and indent it
  vim.api.nvim_win_set_cursor(0, { insert_row + 1, 0 })
  vim.cmd 'normal! =='
  -- Restore original cursor position
  vim.api.nvim_win_set_cursor(0, orig_pos)
end
vim.keymap.set('n', '<leader>cl', add_log, { desc = 'Add log' })

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

map('n', '<leader>go', function() -- [r]emote
  git_open_remote 'origin'
end, { desc = 'Browse origin' })

map('n', '<leader>gO', function()
  git_open_remote 'upstream'
end, { desc = 'Browse upstream' })

----------------------------------------------------------------------------------------------------
-- Toggle keymaps
----------------------------------------------------------------------------------------------------

map('n', '<leader>t', '<Nop>', { desc = 'Toggle' })
map('n', '<leader>tw', '<cmd>set wrap!<cr>', { desc = 'Wrap line' })
map('n', '<leader>td', vim.diagnostic.open_float, { desc = 'Diagnostics popup' })
map('n', '<leader>tr', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
  vim.notify('Relative line numbers: ' .. (vim.wo.relativenumber and 'on' or 'off'), vim.log.levels.INFO)
end, { desc = 'Relative line numbers' })

----------------------------------------------------------------------------------------------------
-- Yank to clipboard keymaps
----------------------------------------------------------------------------------------------------

map('n', '<leader>y', '<Nop>', { desc = 'Yank to clipboard' })

local function copy_to_clipboard(expand_pattern, label)
  local value = vim.fn.expand(expand_pattern)
  vim.fn.setreg('+', value)
  print('Copied: ' .. value .. (label and (' (' .. label .. ')') or ''))
end

map('n', '<leader>ya', function()
  copy_to_clipboard('%:p', 'absolute path')
end, { noremap = true, silent = true, desc = 'Absolute file path' })

map('n', '<leader>yr', function()
  copy_to_clipboard('%:.', 'relative path')
end, { noremap = true, silent = true, desc = 'Relative file path' })

map('n', '<leader>yn', function()
  copy_to_clipboard('%:t', 'file name')
end, { noremap = true, silent = true, desc = 'Name of file' })

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
