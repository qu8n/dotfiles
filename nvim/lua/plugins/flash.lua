-- Navigate current view with search labels
-- https://github.com/folke/flash.nvim

return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '<C-a>', -- Fl[a]sh
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
  },
}
