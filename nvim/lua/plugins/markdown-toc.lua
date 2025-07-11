-- Auto-add and update table of contents in markdown files
-- https://github.com/hedyhli/markdown-toc.nvim

return {
  'hedyhli/markdown-toc.nvim',
  ft = 'markdown', -- Lazy load on markdown filetype
  cmd = { 'Mtoc' }, -- Or, lazy load on "Mtoc" command
  opts = {},
}
