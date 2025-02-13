-- Show diagnostics under the line instead of next to for improved readability
return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
    vim.diagnostic.config({ virtual_lines = false }) -- disabled by default
  end,
}
