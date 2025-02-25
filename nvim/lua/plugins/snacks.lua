-- Add custom configs to the built-in dashboard shown upon Neovim startup
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = false,
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
