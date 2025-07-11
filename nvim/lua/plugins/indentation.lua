return {
  -- Automatically detect indentation settings based on the buffer's first few hundred lines
  -- https://github.com/NMAC427/guess-indent.nvim
  {
    'NMAC427/guess-indent.nvim',
    event = 'BufReadPre',
  },

  -- Add indentation guides: thin vertical lines that help you see the nesting of code blocks
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'BufReadPre',
    opts = {},
  },
}
