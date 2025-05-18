-- Add custom configs to the built-in statusline plugin
return {
  "nvim-lualine/lualine.nvim",
  opts = {
    -- Hide the current location and time
    sections = {
      lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 1 } },
        -- { "location", padding = { left = 0, right = 1 } },
      },
      lualine_z = {},
    },
  },
}
