-- Add custom configs to the built-in dashboard shown upon Neovim startup
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
  _______________
  |  ___________  |
  | |           | |
  | | $ nvim    | |
  | |           | |
  | '-----------' |
  |_____________-_|
 __/_______\__
________________
/:::::::::':::'::\
 /::======::: .:.:::\
 `""""""""""""""""""`]]
      },
      sections = {
        { section = "header" },
        { section = "keys", padding = 2 },
        { title = "Recent Files", section = "recent_files" },
      },
    }
  },
}
