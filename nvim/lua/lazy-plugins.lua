-- [[ Configure and install plugins ]]

require('lazy').setup {
  spec = {
    -- Auto-install plugins specified in the 'plugins/' directory
    { import = 'plugins' },
  },
  -- Disable automatic plugin updates
  checker = { enabled = false },
  -- Disable config change confirmation dialog
  change_detection = { notify = false },
  -- Disable the requirement for LuaRocks, a package manager for Lua modules.
  -- Re-enable it if it's a dependency for future installed plugins
  rocks = { enabled = false },
}
