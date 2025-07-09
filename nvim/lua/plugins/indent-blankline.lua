-- Adds indentation guides: thin vertical lines that help you see the nesting of code blocks
-- https://github.com/lukas-reineke/indent-blankline.nvim

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
}
