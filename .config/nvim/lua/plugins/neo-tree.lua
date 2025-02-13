-- Add custom configs to the built-in file explorer plugin
return {
  "neo-tree.nvim",
  opts = {
    window = { position = "float" },
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
        never_show = { ".git" },
      },
    },
  },
}
