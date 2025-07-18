return {
  -- Automatically detect indentation settings based on the buffer's first few hundred lines
  -- https://github.com/NMAC427/guess-indent.nvim
  {
    'NMAC427/guess-indent.nvim',
    event = 'BufReadPre',
  },
}
