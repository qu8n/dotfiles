-- Fuzzy find files, buffers, git commits, etc.
-- https://github.com/ibhagwan/fzf-lua

local fzf_keymaps = {
  -- TODO: replace this and the oldfiles search with a picker that combines both `oldfiles` and `files`
  -- upon the merge of PR https://github.com/ibhagwan/fzf-lua/pull/2152
  ['<leader>'] = { sub_cmd = 'files cwd=.', desc = 'Search files (Fzf)' },
  o = { sub_cmd = 'oldfiles cwd_only=true', desc = 'Old files' },
  sb = { sub_cmd = 'buffers sort_mru=true sort_lastused=true', desc = 'Buffers' },
  sc = { sub_cmd = 'commands', desc = 'Commands' },
  sC = { sub_cmd = 'git_commits', desc = 'Commits (git)' },
  sd = { sub_cmd = 'diagnostics_document', desc = 'Diagnostics of file' },
  sD = { sub_cmd = 'diagnostics_workspace', desc = 'Diagnostics of project' },
  sg = { sub_cmd = 'live_grep', desc = 'Grep' },
  sm = { sub_cmd = 'marks', desc = 'Marks' },
  sr = { sub_cmd = 'resume', desc = 'Resume' },
  ss = { sub_cmd = 'git_status', desc = 'Status (git)' },
  su = { sub_cmd = 'colorschemes', desc = 'Colorschemes' }, -- [U]I
  -- s_ = { sub_cmd = 'search_history', desc = 'Search history' }, -- use q/ or q? instead
  -- s_ = { sub_cmd = 'command_history', desc = 'Commands history' }, -- use q: instead
}

local keys = {}
for k, v in pairs(fzf_keymaps) do
  table.insert(keys, {
    '<leader>' .. k,
    '<cmd>FzfLua ' .. v.sub_cmd .. '<cr>',
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
