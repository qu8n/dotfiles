-- Add custom configs to the built-in completion plugin
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
      -- Press Ctrl + y to accept the completion
      ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      -- Disable Enter key to avoid accepting completions when adding newlines
      ["<CR>"] = cmp.config.disable,
    })
  end,
}
