-- [[ Setting options ]]

-- Saner defaults
vim.o.undofile = true -- Save undo history
vim.o.confirm = true -- Confirm on unsaved changes
vim.schedule(function() -- Sync Vim's clipboard with OS' (delayed for better compatibility)
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.mouse = 'a' -- Enable mouse usage

-- Visual and display
vim.o.number = true -- Show line numbers
vim.o.signcolumn = 'yes' -- Always show signcolumn
vim.o.cursorline = true -- Highlight current line
vim.o.list = true -- Replace whitespaces...
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- ...as these characters
vim.wo.wrap = false -- Disable line wrap
vim.o.inccommand = 'split' -- Live preview of :s commands
vim.opt.fillchars = { eob = ' ' } -- No end-of-buffer tilde characters
vim.o.scrolloff = 3 -- Minimum lines above/below cursor when scrolling

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
vim.o.breakindent = true -- Wrapped line repeats indent

-- Enable folding
vim.o.foldmethod = 'expr' -- Define folds using an expression
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- Use Treesitter for folding
vim.o.foldlevel = 99 -- Open all folds by default upon opening a file
vim.opt.foldtext = '' -- Syntax highlight first line of fold

-- Language/Plugin specific
vim.g.markdown_recommended_style = 0 -- Don't override user's markdown softtabstop
