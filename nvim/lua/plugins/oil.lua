-- Vim-like file explorer
-- https://github.com/stevearc/oil.nvim

return {
  'stevearc/oil.nvim',
  keys = {
    -- Open Oil with preview and float modes pre-enabled
    { '<leader>o', '<cmd>Oil --preview<cr>', desc = '[O]il' },
  },
  opts = {
    view_options = {
      show_hidden = true,
      -- Always hide these files/directories even if `show_hidden` is enabled
      is_always_hidden = function(name)
        return name == '.DS_Store' or name == '.git'
      end,
    },
    delete_to_trash = true, -- instead of deleting them permanently
    skip_confirm_for_simple_edits = true, -- e.g. renaming files
  },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations
  lazy = false,
  -- Optional dependencies
  dependencies = {
    { 'echasnovski/mini.icons', opts = {} },
    { 'nvim-tree/nvim-web-devicons' },
  },
}
