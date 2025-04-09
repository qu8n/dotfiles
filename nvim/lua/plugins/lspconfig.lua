-- Add custom configs to the built-in nvim-lspconfig plugin
return {
  "neovim/nvim-lspconfig",
  optional = true,
  opts = {
    -- Hide diagnostic texts by default to avoid cluttering the UI
    -- (Underlines and other visual cues will still be shown)
    diagnostics = {
      virtual_text = false,
      virtual_lines = false,
    },
  },
}
