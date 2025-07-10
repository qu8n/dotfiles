-- Collection of independent modules for file explorer, completion, etc. to pick and use
-- https://github.com/echasnovski/mini.nvim

return {
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      -- https://github.com/echasnovski/mini.ai
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

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

      -- Custom statusline
      -- https://github.com/echasnovski/mini.statusline/blob/main/lua/mini/statusline.lua
      local statusline = require 'mini.statusline'
      -- Change what section goes where by moving/adding/removing these local variables in the
      -- `strings` section below
      local active = function()
        local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 100 }
        local git = MiniStatusline.section_git { trunc_width = 40 }
        -- local diff = MiniStatusline.section_diff { trunc_width = 75 }
        -- local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
        local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
        local filename = MiniStatusline.section_filename { trunc_width = 140 }
        local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
        local location = MiniStatusline.section_location { trunc_width = 75 }
        -- local search = MiniStatusline.section_searchcount { trunc_width = 75 }
        return MiniStatusline.combine_groups {
          { hl = mode_hl, strings = { mode } },
          { hl = 'MiniStatuslineDevinfo', strings = { git, lsp } },
          '%<', -- Mark general truncate point
          { hl = 'MiniStatuslineFilename', strings = { filename } },
          '%=', -- End left alignment
          -- { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
          { hl = mode_hl, strings = { location } },
        }
      end
      require('mini.statusline').setup {
        content = { active = active },
        use_icons = vim.g.have_nerd_font,
      }
      -- Set location section as "current line number / total line number"
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%l/%L'
      end
    end,
  },
}
