return {
  -- https://github.com/bluz71/vim-moonfly-colors
  {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    lazy = false,
    priority = 1000,
    -- Set the default colorscheme
    init = function()
      vim.cmd.colorscheme 'moonfly'
    end,
  },
  -- https://github.com/Mofiqul/vscode.nvim
  {
    "Mofiqul/vscode.nvim",
  },
}
