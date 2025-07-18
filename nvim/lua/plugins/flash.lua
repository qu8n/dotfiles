-- Navigate current view with search labels
-- https://github.com/folke/flash.nvim

return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '\\',
      mode = { 'n' },
      function()
        require('flash').jump()
      end,
      desc = 'Navigate (Flash)',
    },
  },
}
