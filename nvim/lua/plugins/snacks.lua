return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      -- Press `<Esc>` once to close the picker
      -- (Default is `<Esc>` once to normal mode, `<Esc>` twice to close the picker)
      win = {
        input = {
          keys = {
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
          },
        },
      },
      -- Restrict smart file picker to the current project, show recent files first then the rest after
      sources = {
        smart = {
          multi = { 'recent', 'files' },
          filter = { cwd = true },
          matcher = {
            frecency = false,
            sort_empty = false,
          },
        },
      },
    },
    -- Add indentation guides - thin vertical lines that help you see the nesting of code blocks
    indent = { enabled = true },
    -- `nvim <file>` renders file quickly before loading plugins
    quickfile = { enabled = true },
    -- Get access to project- and branch-specific scratch buffers
    scratch = {
      enabled = true,
      -- Set markdown as the default filetype for scratch buffers
      -- Otherwise, it will match the current buffer's filetype (why?)
      ft = 'markdown',
    },
    -- Enable smooth scrolling
    scroll = { enabled = true },
  },
  keys = {
    {
      '<leader><space>',
      function()
        ---@module "snacks" -- silent "Undefined global `Snacks`" diagnostics
        Snacks.picker.smart()
      end,
      desc = 'Files',
    },
    {
      '<leader>b',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Scratch',
    },

    ------------------------------------------------------------------------------------------------
    -- Search
    ------------------------------------------------------------------------------------------------
    {
      '<leader>s',
      '<Nop>',
      desc = 'Search',
    },
    {
      '<leader>s.',
      function()
        Snacks.scratch.select()
      end,
      desc = 'Scratches',
    },
    {
      '<leader>sc',
      function()
        Snacks.picker.commands()
      end,
      desc = 'Commands',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>sm',
      function()
        Snacks.picker.marks()
      end,
      desc = 'Marks',
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.resume()
      end,
      desc = 'Resume',
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'Symbols',
    },
    {
      '<leader>su',
      function()
        Snacks.picker.colorschemes()
      end,
      desc = 'Colorschemes',
    },

    ------------------------------------------------------------------------------------------------
    -- Git
    ------------------------------------------------------------------------------------------------
    {
      '<leader>g',
      '<Nop>',
      desc = 'Git',
    },
    {
      '<leader>gb',
      function()
        Snacks.picker.git_log_line()
      end,
      desc = 'Blame line',
    },
    {
      '<leader>gB',
      function()
        Snacks.picker.git_log_file()
      end,
      desc = 'Blame file',
    },
    {
      '<leader>gl',
      function()
        Snacks.picker.git_log()
      end,
      desc = 'Log',
    },
    {
      '<leader>gr',
      function()
        Snacks.picker.git_branches()
      end,
      desc = 'Branches',
    },
    {
      '<leader>gs',
      function()
        Snacks.picker.git_status()
      end,
      desc = 'Status',
    },

    ------------------------------------------------------------------------------------------------
    -- LSP
    ------------------------------------------------------------------------------------------------
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Definition',
    },
    {
      'gD',
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = 'Declaration',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true, -- ignore nvim's built-in LSP keymaps like gra, grr, etc.
      desc = 'References',
    },
    {
      'gI',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = 'Implementation',
    },
    {
      'gy',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'T[y]pe definition',
    },
  },
}
