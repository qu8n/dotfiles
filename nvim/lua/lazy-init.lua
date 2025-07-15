-- [[ Lazy.nvim configurations ]]

-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Configure lazy.nvim
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
  -- Disable select built-in plugins to improve performance
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}
