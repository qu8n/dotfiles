-- Fuzzy find files, buffers, git commits, etc.
-- https://github.com/ibhagwan/fzf-lua

local fzf_keymaps = {
  ['<leader>'] = { sub_cmd = 'files cwd=.', desc = 'Search files' },
  sb = { sub_cmd = 'buffers sort_mru=true sort_lastused=true', desc = 'Buffers' },
  sc = { sub_cmd = 'commands', desc = 'Commands' },
  sd = { sub_cmd = 'diagnostics_document', desc = 'Diagnostics of file' },
  sD = { sub_cmd = 'diagnostics_workspace', desc = 'Diagnostics of project' },
  sg = { sub_cmd = 'git_status', desc = 'Git status' },
  sG = { sub_cmd = 'git_commits', desc = 'Git commits' },
  sm = { sub_cmd = 'marks', desc = 'Marks' },
  sr = { sub_cmd = 'oldfiles cwd_only=true', desc = 'Recent files' },
  sR = { sub_cmd = 'resume', desc = 'Resume' },
  ss = { sub_cmd = 'live_grep', desc = 'Grep' },
  su = { sub_cmd = 'colorschemes', desc = 'UI: Colorschemes' },
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
      -- Enable live grepping filenames in a directory
      -- Ex: Find all occurrences of "enable" but only in the "plugins" directory
      -- ex: > enable --*/plugins/*
      -- Source: https://www.reddit.com/r/neovim/comments/1hhiidm/a_few_nice_fzflua_configurations_now_that_lazyvim
      rg_glob = true, -- enable glob parsing
      glob_flag = '--iglob', -- case insensitive globs
      glob_separator = '%s%-%-', -- query separator pattern (lua): ' --'
    },
  },
}
