-- Highlight todo, notes, etc in comments
-- https://github.com/folke/todo-comments.nvim

return {
  {
    'folke/todo-comments.nvim',
    keys = {
      {
        '<leader>st',
        function()
          require('todo-comments.fzf').todo()
        end,
        desc = '[T]odos',
      },
      {
        ']t',
        function()
          require('todo-comments').jump_next()
        end,
        desc = '[T]odo comment',
      },
      {
        '[t',
        function()
          require('todo-comments').jump_prev()
        end,
        desc = '[T]odo comment',
      },
    },

    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
