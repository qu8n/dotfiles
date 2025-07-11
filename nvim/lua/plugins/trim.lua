-- Automatically trim trailing whitespace and lines upon saving a file
-- https://github.com/cappyzawa/trim.nvim

return {
  'cappyzawa/trim.nvim',
  event = 'BufWritePre',
}
