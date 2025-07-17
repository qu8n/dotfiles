-- Code formatter with LSP integration and format-on-save support
-- https://github.com/stevearc/conform.nvim

return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = true,
      formatters_by_ft = {
        -- Can run multiple formatters sequentially or run the first available formatter:
        -- python = { "isort", "black" },
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
        lua = { 'stylua' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        python = { 'black' },
      },
      formatters = {
        -- Require a config file to run to avoid using w/e the defaults are that conform.nvim provides
        -- https://github.com/stevearc/conform.nvim/issues/407
        prettier = {
          require_cwd = true, -- requires prettierrc
        },
        black = {
          require_cwd = true, -- requires pyproject.toml (TODO: confirm this)
        },
      },
    },
  },
}
