-- [[ Basic Autocommands ]]

local a = vim.api

-- Highlight when yanking (copying) text (See `:help vim.hl.on_yank()`)
a.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Automatically trim select whitespaces on buffer save
a.nvim_create_autocmd('BufWritePre', {
  callback = function()
    local curr_cursor_position = a.nvim_win_get_cursor(0)
    vim.cmd [[%s/\s\+$//e]] -- trailing whitespace at the end of each line
    vim.cmd [[%s/\%^\n\+//e]] -- blank lines at the start of the file
    vim.cmd [[%s/\($\n\s*\)\+\%$//e]] -- blank lines at the end of the file
    -- Restore cursor position after trimming and handle the edge case where the cursor is at a
    -- line that gets deleted
    local line_count = a.nvim_buf_line_count(0)
    local clamped_line = math.min(curr_cursor_position[1], line_count)
    a.nvim_win_set_cursor(0, { clamped_line, curr_cursor_position[2] })
  end,
})

-- Set minimum lines above/below cursor when scrolling on non-terminal buffers
a.nvim_create_autocmd({ 'BufEnter', 'WinEnter', 'CursorMoved' }, {
  callback = function()
    vim.o.scrolloff = (vim.bo.buftype == 'terminal') and 0 or 3
  end,
})

-- Neovim detects `.env` files as having the `sh` (shell script) filetype. This leads to diagnostics
-- of "<variable> appears unused" for each variable in the `.env`. This disable those messages.
-- Setting the filetype to some custom type also works, but we'd lose syntax highlighting, etc.
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '.env*',
  callback = function(e)
    vim.diagnostic.enable(false, { bufnr = e.buf })
  end,
})

----------------------------------------------------------------------------------------------------
-- Saner defaults
----------------------------------------------------------------------------------------------------

-- Restore cursor position when opening a file
-- https://github.com/neovim/neovim/issues/16339#issuecomment-1457394370
a.nvim_create_autocmd('BufRead', {
  callback = function(opts)
    a.nvim_create_autocmd('BufWinEnter', {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].filetype
        local last_known_line = a.nvim_buf_get_mark(opts.buf, '"')[1]
        if not (ft:match 'commit' and ft:match 'rebase') and last_known_line > 1 and last_known_line <= a.nvim_buf_line_count(opts.buf) then
          a.nvim_feedkeys([[g`"]], 'nx', false)
        end
      end,
    })
  end,
})

-- https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers
local function win_is_float(winnr)
  local wincfg = a.nvim_win_get_config(winnr)
  if wincfg and (wincfg.external or (wincfg.relative and #wincfg.relative > 0)) then
    return true
  end
  return false
end
a.nvim_create_autocmd('BufLeave', {
  callback = function()
    local from_buf = a.nvim_get_current_buf()
    local from_win = vim.fn.bufwinid(from_buf)
    local to_win = a.nvim_get_current_win()
    if not win_is_float(to_win) and not win_is_float(from_win) then
      vim.b.__VIEWSTATE = vim.fn.winsaveview()
    end
  end,
})
a.nvim_create_autocmd('BufEnter', {
  callback = function()
    if vim.b.__VIEWSTATE then
      local to_win = a.nvim_get_current_win()
      if not win_is_float(to_win) then
        vim.fn.winrestview(vim.b.__VIEWSTATE)
      end
      vim.b.__VIEWSTATE = nil
    end
  end,
})

----------------------------------------------------------------------------------------------------
-- Add "colorcolumn", vertical lines that serve as visual guides for line length
----------------------------------------------------------------------------------------------------

-- Override the default, which looks too bright for the black background
a.nvim_command 'highlight ColorColumn guibg=#202020'

-- Set specific colorcolumns based on filetype
local colorcolumn_by_filetype = {
  markdown = '80', -- conventional limit
  python = '88', -- Black's default
}

a.nvim_create_autocmd('FileType', {
  callback = function(args)
    local col = colorcolumn_by_filetype[args.match]
    if col then
      vim.opt_local.colorcolumn = col
    else
      -- By default, set two colorcolumns at 100 and 120 characters
      -- Note: Many languages don't have an agreed-upon line length. The legacy convention was 80,
      -- when programs were written on punch cards. With today's wide screens, many recommend 100
      -- and 120 as the soft and hard limits, respectively
      vim.opt_local.colorcolumn = '100,120'
    end
  end,
})

-- Set special guides for the commit message buffer that opens when running `git commit` w/o `-m`
-- The recommended lengths are 50 and 72 for the git commit message and body, respectively
a.nvim_create_autocmd('BufRead', {
  pattern = 'COMMIT_EDITMSG',
  callback = function()
    vim.opt_local.colorcolumn = '50,72'
  end,
})
