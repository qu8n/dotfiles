-- File explorer and tree viewer with sidebar, floating window, git status, and buffer/tab support
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'Open Neotree', silent = true },
  },
  opts = {
    window = {
      width = 30,
    },
    filesystem = {
      window = {
        position = 'left',
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      filtered_items = {
        visible = true, -- show hidden files, but dim/gray them out for less visual clutter
        hide_dotfiles = false,
        hide_by_name = {
          '.github',
          '.gitignore',
          'package-lock.json',
        },
        -- Do not show these files/folders at all
        never_show = { '.git', '.DS_Store' },
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)
    -- On startup, move cursor from Neo-tree to the empty buffer for quick access to which-key
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        vim.schedule(function()
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            local bufname = vim.api.nvim_buf_get_name(buf)
            if not bufname:match 'neo%-tree' then
              vim.api.nvim_set_current_win(win)
              break
            end
          end
        end)
      end,
    })
  end,
}
