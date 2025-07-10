-- GitHub Copilot completion
-- https://github.com/zbirenbaum/copilot.lua

return {
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    keys = {
      { '<leader>tc', '<cmd>Copilot toggle<cr>', desc = 'Copilot' },
      { '<leader>ac', '<cmd>Copilot toggle<cr>', desc = 'Copilot: toggle' },
    },
    opts = {
      suggestion = {
        auto_trigger = true, -- start suggesting on INSERT mode
        auto_refresh = true, -- refresh suggestions as you type
        hide_during_completion = false,
        keymap = {
          accept = '<M-y>', -- [y]es to current suggestion
          dismiss = '<M-n>', -- [n]o to current suggestion
          accept_word = '<M-w>', -- accept the next [w]ord
          accept_line = '<M-l>', -- accept the current [l]ine
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
