-- Emulate the behavior of the Cursor IDE
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    -- provider = "claude", -- set default provider (defaults to claude)
    -- Custom providers
    vendors = {
      -- To set up a local model server with LM Studio, open the app > Developer
      -- > select the model > Command + R to start the server
      -- Suggestion: click on the Load tab, then increase the context length
      -- for a faster response (e.g. set to max of 163,840 tokens)
      lmstudio = {
        __inherited_from = "openai",
        api_key_name = "",
        endpoint = "http://localhost:1234/v1",
        model = "deepseek-coder-v2-lite-instruct-mlx:16b",
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
