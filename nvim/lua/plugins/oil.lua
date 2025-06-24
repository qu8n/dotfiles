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
      -- Always hide `.DS_Store` files, even if `show_hidden` is enabled
      is_always_hidden = function(name)
        return name == ".DS_Store" or name == ".git"
      end,
    },
    delete_to_trash = true, -- move files to trash instead of deleting them permanently
    skip_confirm_for_simple_edits = false, -- skip confirmation for simple edits like renaming files
  },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
