-- Add custom configs to the built-in file explorer plugin
return {
  "nvim-neo-tree/neo-tree.nvim",
  -- Disable these quick access keys for Oil's usage instead
  -- Can still be accessed via <leader>fe and <leader>fE
  keys = {
    { "<leader>e", false },
    { "<leader>E", false },
  },
  opts = {
    window = { position = "left" },
    filesystem = {
      filtered_items = {
        -- Show hidden files, but dim/gray them out for less visual clutter
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true, -- hide all files specified in .gitignore
        hide_by_name = {
          ".github",
          ".gitignore",
          "package-lock.json",
        },
        -- Do not show these files/folders at all
        never_show = { ".git", ".DS_Store" },
      },
    },
  },
}
