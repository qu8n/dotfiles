-- Supports adding extensions, like connecting to an MCP server. See https://codecompanion.olimorris.dev/extensions/mcphub
return {
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  -- Override the LazyExtra markdown renderer to render markdown in codecompanion's chat buffer
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },
}
