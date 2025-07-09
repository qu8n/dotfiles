-- GitHub Copilot completion
-- https://github.com/zbirenbaum/copilot.lua

return {
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    keys = {
      { '<leader>tc', '<cmd>Copilot toggle<cr>', desc = '[C]opilot' },
      { '<leader>ac', '<cmd>Copilot toggle<cr>', desc = '[C]opilot: toggle' },
    },
    opts = {
      suggestion = {
        auto_trigger = true, -- start suggesting on INSERT mode
        auto_refresh = true, -- refresh suggestions as you type
        hide_during_completion = false,
        keymap = {
          accept = '<C-.>',
          dismiss = '<C-/>',
          accept_word = '<M-w>',
          accept_line = '<M-l>',
          next = '<M-]>',
          prev = '<M-[>',

        },
      },
      -- Override the default which disables select filetypes
      filetypes = {
        markdown = true,
        yaml = true,
        ['.'] = true,
      },
      -- Panel lets you preview suggestions in a split window. Not needed
      panel = { enabled = false },
    },
  },
}
