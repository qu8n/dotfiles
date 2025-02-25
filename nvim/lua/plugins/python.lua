-- Modify the Python LSP configs to support formatting
-- Source: https://www.reddit.com/r/neovim/comments/15ps0vx/comment/jw1b6vl
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts = opts or {}
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "black")
      return opts
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      opts = opts or {}
      opts.sources = opts.sources or {}
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.black)
      return opts
    end,
  },
}
