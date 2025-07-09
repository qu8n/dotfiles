-- File explorer and tree viewer with sidebar, floating window, git status, and buffer/tab support
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
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
    filesystem = {
      window = {
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
}
