-- Fuzzy find files, buffers, git commits, etc.
-- https://github.com/ibhagwan/fzf-lua

local fzf_keymaps = {
  -- TODO: replace this and the oldfiles search with a picker that combines both `oldfiles` and `files`
  -- upon the merge of PR https://github.com/ibhagwan/fzf-lua/pull/2152
  ['<leader>'] = { sub_cmd = '<cmd>FzfLua files cwd=.<cr>', desc = 'Search files' },
  o = { sub_cmd = '<cmd>FzfLua oldfiles cwd_only=true<cr>', desc = 'Old files' },
  ['/'] = { sub_cmd = '<cmd>FzfLua lgrep_curbuf<cr>', desc = 'Grep buffer' },
  -- Search
  s = { sub_cmd = '<Nop>', desc = 'Search' },
  sb = { sub_cmd = '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', desc = 'Buffers' },
  sc = { sub_cmd = '<cmd>FzfLua commands<cr>', desc = 'Commands' },
  sd = { sub_cmd = '<cmd>FzfLua diagnostics_workspace<cr>', desc = 'Diagnostics' },
  sf = { sub_cmd = '<cmd>FzfLua builtin<cr>', desc = 'FzfLua commands' },
  sg = { sub_cmd = '<cmd>FzfLua live_grep<cr>', desc = 'Grep' },
  sm = { sub_cmd = '<cmd>FzfLua marks<cr>', desc = 'Marks' },
  sr = { sub_cmd = '<cmd>FzfLua resume<cr>', desc = 'Resume' },
  su = { sub_cmd = '<cmd>FzfLua colorschemes<cr>', desc = 'Colorschemes' },
  -- Git
  gl = { sub_cmd = '<cmd>FzfLua git_commits<cr>', desc = 'Log' },
  gs = { sub_cmd = '<cmd>FzfLua git_status<cr>', desc = 'Status' },
  gb = { sub_cmd = '<cmd>FzfLua git_blame<cr>', desc = 'Blame' },
  -- Exlusions
  -- Note: Use Vim's built-in commands instead of these FzfLua commands
  -- s_ = { sub_cmd = '<cmd>FzfLua search_history<cr>', desc = 'Search history' }, -- use q/ or q? instead
  -- s_ = { sub_cmd = '<cmd>FzfLua command_history<cr>', desc = 'Commands history' }, -- use q: instead
}

local keys = {}
for k, v in pairs(fzf_keymaps) do
  table.insert(keys, {
    '<leader>' .. k,
    v.sub_cmd,
    desc = v.desc,
  })
end

return {
  'ibhagwan/fzf-lua',
  keys = keys,
  opts = {
    oldfiles = {
      -- Include old files from the current session in the old buffers view
      include_current_session = true,
    },
    previewers = {
      builtin = {
        -- Improve performance by disabling syntax highlighting when previewing large files
        syntax_limit_b = 1024 * 100, -- 100KB
      },
    },
    grep = {
      -- Enable `FzfLua live_grep` to search terms in specific directories
      -- Example: Find occurrences of "enable" only in the "plugins" directory: `enable --*/plugins/*`
      -- Source: https://www.reddit.com/r/neovim/comments/1hhiidm/a_few_nice_fzflua_configurations_now_that_lazyvim
      glob_separator = '%s%-%-', -- query separator pattern (lua): ' --'
      rg_glob = true, -- enable glob parsing
      glob_flag = '--iglob', -- case insensitive globs
    },
  },
  init = function()
    -- Make any plugin that uses vim.ui.select use FzfLua automatically
    local ok, fzf_lua = pcall(require, 'fzf-lua')
    if ok then
      fzf_lua.register_ui_select()
    end
  end,
}
