-- Fuzzy find files, buffers, git commits, etc.
-- https://github.com/ibhagwan/fzf-lua

local fzf_keymaps = {
  ['<leader>'] = { sub_cmd = 'files cwd=.', desc = 'Search files' },
  -- Search
  sb = { sub_cmd = 'buffers sort_mru=true sort_lastused=true', desc = '[B]uffers' },
  sc = { sub_cmd = 'command_history', desc = '[C]ommand history' },
  sC = { sub_cmd = 'commands', desc = '[C]ommands' },
  sg = { sub_cmd = 'live_grep', desc = '[G]rep' },
  sm = { sub_cmd = 'marks', desc = '[M]arks'},
  so = { sub_cmd = 'colorschemes', desc = 'C[o]lorschemes'},
  sr = { sub_cmd = 'oldfiles cwd_only=true', desc = '[R]ecent files' },
  sR = { sub_cmd = 'resume', desc = '[R]esume' },
  ss = { sub_cmd = 'search_history', desc = '[S]earch history' },
  -- Git
  gc = { sub_cmd = 'git_commits', desc = '[C]ommits' },
  gs = { sub_cmd = 'git_status', desc = '[S]tatus' },
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
