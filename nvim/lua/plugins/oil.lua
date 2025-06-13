-- Vim-like file explorer
return {
  "stevearc/oil.nvim",
  keys = {
    -- Open Oil with preview and float modes pre-enabled
    { "<leader>e", "<cmd>Oil --preview --float<cr>", desc = "Open Oil" },
  },
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
    -- Move deleted files to trash instead of deleting them permanently. See `:help oil-trash`
    delete_to_trash = true,
  },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
