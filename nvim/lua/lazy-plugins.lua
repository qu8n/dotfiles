-- [[ Configure and install plugins ]]

require('lazy').setup {
  spec = {
    -- TODO: install these plugins in their own files and specify trigger events
    --
    -- Install plugins with no custom configs
    'NMAC427/guess-indent.nvim', -- detect tabstop and shiftwidth automatically
    'danilamihailov/beacon.nvim', -- flash cursor position when going to a new buffer or location
    'cappyzawa/trim.nvim', -- automatically trim trailing whitespace and lines upon saving a file

    -- Install plugins with custom configs
    { import = 'plugins' }, -- auto-install all plugins specified in the 'plugins/' directory
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
