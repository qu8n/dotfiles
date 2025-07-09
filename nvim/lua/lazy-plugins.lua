-- [[ Configure and install plugins ]]

require('lazy').setup {
  spec = {
    -- Install plugins with no custom configs
    'NMAC427/guess-indent.nvim', -- detect tabstop and shiftwidth automatically
    'danilamihailov/beacon.nvim', -- flash cursor position when going to a new buffer or location
    "cappyzawa/trim.nvim", -- automatically trim trailing whitespace and lines upon saving a file

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
}
