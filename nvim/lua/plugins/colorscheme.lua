return {
  -- Add external colorschemes
  {
    "Mofiqul/vscode.nvim",
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      -- Set the default colorscheme
      -- Pass in the name of an external colorscheme that is defined above,
      -- or use a built-in colorscheme. See colorschemes via <Leader>uC
      colorscheme = "moonfly",
    },
  },
}
