-- Shows keymaps in a popup modal
-- https://github.com/folke/which-key.nvim

return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      preset = 'helix', -- stack items vertically
      delay = 0, -- b/w pressing a keyand opening which-key (in ms)
      icons = { mappings = false }, -- disable icons
    },
  },
}
