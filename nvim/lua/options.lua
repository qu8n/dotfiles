-- [[ Setting options ]]

-- Aliases for convenience
local o = vim.o
local opt = vim.opt
local wo = vim.wo
local g = vim.g

-- Set <space> as the leader key (must happen before any plugins are loaded)
g.mapleader = ' '
g.maplocalleader = ' '

-- Saner defaults
o.undofile = true -- Save undo history
o.confirm = true -- Confirm on unsaved changes
o.clipboard = 'unnamedplus' -- Sync with system clipboard
o.mouse = 'a' -- Enable mouse usage
o.autoread = true -- Automatically refresh buffer when changed outside of Vim

-- Visual and display
g.have_nerd_font = true -- Use Nerd Font for icons
o.number = true -- Show line numbers
o.relativenumber = true -- Show relative line numbers
o.signcolumn = 'yes' -- Always show signcolumn
o.cursorline = true -- Highlight current line
o.list = true -- Replace whitespaces...
o.inccommand = 'split' -- Show live preview of in-progress :s commands
o.ls = 0 -- Hide the status line that shows the filepath...
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- ...as these characters
opt.fillchars = { eob = ' ' } -- No end-of-buffer tilde characters
opt.winbar = '%m %f' -- ...and show the filepath at the top of the buffer instead
wo.wrap = false -- Disable line wrap

-- Search behavior
o.ignorecase = true -- Case-insensitive search...
o.smartcase = true -- ...unless uppercase in search

-- Performance and timing
o.updatetime = 500 -- Faster update time for plugins
o.timeoutlen = 300 -- Shorter mapping timeout

-- Splits and window management
o.splitright = true -- New splits open right
o.splitbelow = true -- New splits open below

-- Indentation and tabs
o.breakindent = true -- Wrapped line repeats indent
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Enable smart indent
opt.shiftwidth = 2 -- Spaces per indent
opt.tabstop = 2 -- Spaces for <Tab>
opt.hidden = true -- Enable switching buffers without saving

-- Enable folding
o.foldmethod = 'expr' -- Define folds using an expression
o.foldlevel = 99 -- Open all folds by default upon opening a file
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- Use Treesitter for folding
opt.foldtext = '' -- Syntax highlight first line of fold

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

-- Disable file backup when saving
o.backup = false
o.writebackup = false

-- Language/Plugin specific
g.markdown_recommended_style = 0 -- Don't override user's markdown softtabstop
for _, plugin in pairs { -- Disable unused built-in Neovim plugins
  'netrwFileHandlers',
  '2html_plugin',
  'spellfile_plugin',
  'matchit',
} do
  vim.g['loaded_' .. plugin] = 1
end
