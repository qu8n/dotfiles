-- Add custom configs to the built-in dashboard shown upon Neovim startup
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
NeoVim
____________________________________________________________
        ]]
      }
    }
  }
}
