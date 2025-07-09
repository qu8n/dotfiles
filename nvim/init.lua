-- Set <space> as the leader key
-- Must happen before any plugins are loaded so they can use it as their leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require 'options'
require 'keymaps'
require 'autocmds'
require 'lazy-bootstrap'
require 'lazy-plugins'
