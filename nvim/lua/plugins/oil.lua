return {
  "stevearc/oil.nvim",
  keys = {
    { "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil" },
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
