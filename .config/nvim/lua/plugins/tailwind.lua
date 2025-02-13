-- Add custom configs to various plugins for TailwindCSS QoL improvements
-- Source: https://www.youtube.com/watch?v=_NiWhZeR-MY
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
    -- Equivalent to manually toggling `tailwindcss-language-server` in Mason
    -- Setting it explicitly here lets us automatically configure this in a new environment in the future
      servers = {
        -- This enables TailwindCSS IntelliSense that suggests class names as you type
        tailwindcss = {},
      },
    },
  },
    -- Enables highlighting of TailwindCSS classes in your code (e.g. a yellow background for `bg-yellow-500`)
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  -- Enable highlighting of the TailwindCSS classes in the IntelliSense suggestion dropdown
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
