-- [[ Setting options ]]

-- Show line numbers by default
vim.o.number = true

-- Enable mouse usage for scrolling, resizing splits, etc.
vim.o.mouse = 'a'

-- Hide Vim mode as it's already shown in mini.statusline
vim.o.showmode = false

-- Wrapped line repeats indent
vim.o.breakindent = true

-- Sync clipboard between OS and Neovim
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Show signcolumn by default (symbol column to the left of line numbers)
vim.o.signcolumn = 'yes'

-- Interval in ms that Vim checks for external file changes, writes swap files, and is
--  used by many plugins
-- Default is 4000ms (4s), lowering this leads to a better perception of performance
--  but burdens the computer system and can lead to plugin glitches
vim.o.updatetime = 250

-- How long Vim will wait after each keystroke of the keymapping (e.g. netrw's gh) before
--  aborting it and carrying out the behaviour of the keys typed so far
-- The quicker you type these mappings, the smaller this value needs to be
vim.o.timeoutlen = 300

-- How new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- How neovim will display certain whitespace characters in the editor
-- (See `:help 'list'` and `:help 'listchars'`)
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions (`:s`) live, as you type
vim.o.inccommand = 'split'

-- Highlight the current line that your cursor is on
vim.o.cursorline = true

-- Minimal number of lines to keep above and below the cursor as you navigate up/down the buffer
vim.o.scrolloff = 3

-- When performing an action that would discard unsaved changes (e.g. `:q`), Vim will prompt you
-- with a confirmation dialog (see `:help 'confirm'`)
vim.o.confirm = true

-- Configure indentations and tabs
vim.opt.expandtab = true -- pressing TAB inserts spaces instead of a tab character
vim.opt.smartindent = true -- enable built-in smart indentation
vim.opt.shiftwidth = 2 -- number of spaces inserted for each indentation level
vim.opt.tabstop = 2 -- number of spaces that a <Tab> in the file counts for

-- Enable switching away from current buffer without saving
-- (This only works if the buffer being switched to already exists)
vim.opt.hidden = true

-- Turn off automatic line wrap by default
vim.wo.wrap = false

-- Prevent markdown's recommended style from overriding user's softtabstop settings
vim.g.markdown_recommended_style = 0
