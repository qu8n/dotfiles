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
        desc = 'Todos',
      },
      {
        ']t',
        function()
          require('todo-comments').jump_next()
        end,
        desc = 'Todo comment',
      },
      {
        '[t',
        function()
          require('todo-comments').jump_prev()
        end,
        desc = 'Todo comment',
      },
    },

    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
