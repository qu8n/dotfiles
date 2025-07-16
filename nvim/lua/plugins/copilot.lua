-- Copilot text completion and chat integration for Neovim

return {
  -- GitHub Copilot completion
  -- https://github.com/zbirenbaum/copilot.lua
  {
    'zbirenbaum/copilot.lua',
    event = 'BufReadPost',
    config = function(_, opts)
      local copilot = require 'copilot'
      -- Because :Copilot toggle doesn't work reliably
      local function toggle_copilot()
        if require('copilot.client').is_disabled() then
          require('copilot.command').enable()
        else
          require('copilot.command').disable()
        end
      end
      vim.keymap.set('n', '<leader>tc', toggle_copilot, { desc = 'Toggle Copilot' })
      vim.keymap.set('n', '<leader>ac', toggle_copilot, { desc = 'Toggle Copilot' })
      copilot.setup(opts)
    end,
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

  -- Chat with Copilot
  -- https://github.com/CopilotC-Nvim/CopilotChat.nvim
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    event = 'VeryLazy',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      -- For curl, log and async functions
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    keys = {
      -- AI group
      { '<leader>aC', '<cmd>CopilotChatToggle<cr>', desc = 'CopilotChat toggle' },
      { '<leader>as', '<cmd>CopilotChatStop<cr>', desc = 'Stop output (CC)' },
      { '<leader>ar', '<cmd>CopilotChatReset<cr>', desc = 'Reset window (CC)' },
      { '<leader>ap', '<cmd>CopilotChatPrompts<cr>', desc = 'Prompts picker (CC)' },
      { '<leader>am', '<cmd>CopilotChatModels<cr>', desc = 'Models picker (CC)' },
      -- Toggle group
      { '<leader>tC', '<cmd>CopilotChatToggle<cr>', desc = 'CopilotChat' },
    },
    -- Customize the Copilot Chat UI
    opts = function()
      return {
        auto_insert_mode = true,
        question_header = '  User ',
        answer_header = '  Copilot ',
        window = {
          width = 0.4,
          footer = 'test',
        },
      }
    end,
    -- Required for macOS
    build = 'make tiktoken',
    config = function(_, opts)
      -- Recommended by the docs for the best autocompletion experience
      vim.opt.completeopt:append 'popup'
      -- Hide line numbers in the chat buffer
      local chat = require 'CopilotChat'
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-chat',
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })
      chat.setup(opts)
    end,
  },
}
