-- [[ Configure and install plugins ]]

require('lazy').setup {
  spec = {
    -- Auto-install plugins specified in the 'plugins/' directory
    { import = 'plugins' },
  },
  -- Auto check for plugin updates
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  },
  -- Disable config change confirmation dialog
  change_detection = { notify = false },
  -- LuaRocks is a package manager for Lua modules. We don't have a need for it
  -- Re-enable it if luarocks is a dependency for installed plugins
  rocks = { enabled = false },
}
