-- Override the default LazyVim/NeoVim terminal with a different terminal plugin
--
-- Usage:
-- To toggle it, do it as you would with the default by pressing Ctrl + /
-- To split, have a terminal open, then press Esc 2x to enter Normal mode, then 2 + Ctrl + /
-- To open a specific terminal buffer, with terminals closed, press 1 + Ctrl + / to open terminal "1", and so on
return {
  {
    "akinsho/toggleterm.nvim",
    opts = {},
  },
}
