-- Show diagnostics under the line instead of next to for improved readability
return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    coxpcallonfig = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({ virtual_lines = false }) -- disabled by default
    end,
  },
  {
    "nvim-lspconfig",
    opts = {
      diagnostics = {
        -- Disable virtual_text since it's redundant due to lsp_lines
        virtual_text = false,
      },
    },
  },
}
