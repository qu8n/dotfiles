-- Collection of independent modules for file explorer, completion, etc. to pick and use
-- https://github.com/echasnovski/mini.nvim

return {
  {
    'echasnovski/mini.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects', -- required for mini.ai's custom textobjects below
    },
    config = function()
      -- Better Around/Inside textobjects
      -- https://github.com/echasnovski/mini.ai
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      local ai = require 'mini.ai'
      local gen_ai_spec = require('mini.extra').gen_ai_spec
      ai.setup {
        n_lines = 500, -- max number of lines to search for textobjects
        -- Add additional capabilities
        custom_textobjects = {
          g = gen_ai_spec.buffer(), -- entire buffer (g for "global")
          o = ai.gen_spec.treesitter { -- code bl[o]ck
            a = { '@block.outer', '@conditional.outer', '@loop.outer' },
            i = { '@block.inner', '@conditional.inner', '@loop.inner' },
          },
          f = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' }, -- function
          c = ai.gen_spec.treesitter { a = '@class.outer', i = '@class.inner' }, -- class
          t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' }, -- tags
          d = { '%f[%d]%d+' }, -- digits
          e = { -- word with case
            { '%u[%l%d]+%f[^%l%d]', '%f[%S][%l%d]+%f[^%l%d]', '%f[%P][%l%d]+%f[^%l%d]', '^[%l%d]+%f[^%l%d]' },
            '^().*()$',
          },
          u = ai.gen_spec.function_call(), -- u for "usage"
          U = ai.gen_spec.function_call { name_pattern = '[%w_]' }, -- without dot in function name
        },
      }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      -- https://github.com/echasnovski/mini.surround
      -- Examples:
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Auto add pairs like (), {}, and "" as you type
      -- https://github.com/echasnovski/mini.pairs
      require('mini.pairs').setup {
        -- skip when the next character is one of these
        skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
        -- skip when the cursor is inside these treesitter nodes
        skip_ts = { 'string' },
        -- skip when next character is a closing pair & there are more closing than opening pairs
        skip_unbalanced = true,
        -- better deal with markdown code blocks
        markdown = true,
      }

      -- Animate nvim actions like cursor paths, smooth scrolling, window opening/closing/resizing
      -- https://github.com/echasnovski/mini.animate
      local animate = require 'mini.animate'
      animate.setup {
        -- Override the scrolling defaults to make it feel smoother
        scroll = {
          -- How long to animate the scrolling (default is 250ms)
          timing = animate.gen_timing.linear { duration = 200, unit = 'total' },
          -- Number of animation steps per scroll (default is 60)
          subscroll = animate.gen_subscroll.equal { max_output_steps = 120 },
        },
        -- Disable cursor path as it looks wonky when switching b/w split windows
        cursor = { enable = false },
      }
    end,
  },
}
