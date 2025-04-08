return {
  -- Add external colorschemes
  {
    "Mofiqul/vscode.nvim",
  },
  -- Set the default colorscheme
  -- Pass in the name of an external colorscheme that is defined above,
  -- or use a built-in colorscheme. See colorschemes via <Leader>uC
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
