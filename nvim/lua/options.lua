-- [[ Setting options ]]

-- Visual, display, and interaction settings
vim.o.number = true -- Show line numbers
vim.o.mouse = 'a' -- Enable mouse usage
vim.o.signcolumn = 'yes' -- Always show signcolumn
vim.o.breakindent = true -- Wrapped line repeats indent
vim.o.cursorline = true -- Highlight current line
vim.o.scrolloff = 3 -- Minimal lines above/below cursor
vim.o.list = true -- Show whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- as these characters
vim.wo.wrap = false -- Disable line wrap
vim.o.inccommand = 'split' -- Live preview of :s commands

-- File handling, history, and clipboard
vim.o.undofile = true -- Save undo history
vim.o.confirm = true -- Confirm on unsaved changes
vim.schedule(function() -- Sync clipboard with OS (delayed for better compatibility)
  vim.o.clipboard = 'unnamedplus'
end)

-- Search behavior
vim.o.ignorecase = true -- Case-insensitive search...
vim.o.smartcase = true -- ...unless uppercase in search

-- Performance and timing
vim.o.updatetime = 250 -- Faster update time for plugins
vim.o.timeoutlen = 300 -- Shorter mapping timeout

-- Splits and window management
vim.o.splitright = true -- New splits open right
vim.o.splitbelow = true -- New splits open below

-- Indentation and tabs
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Enable smart indent
vim.opt.shiftwidth = 2 -- Spaces per indent
vim.opt.tabstop = 2 -- Spaces for <Tab>
vim.opt.hidden = true -- Enable switching buffers without saving

-- Enable folding
vim.o.foldmethod = 'expr' -- Define folds using an expression
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- Use Treesitter for folding
vim.o.foldlevel = 99 -- Open all folds by default upon opening a file
vim.opt.foldtext = '' -- Syntax highlight first line of fold

-- Language/Plugin specific
vim.g.markdown_recommended_style = 0 -- Don't override user's markdown softtabstop
