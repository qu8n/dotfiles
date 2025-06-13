-- Auto-add and update table of contents in markdown files
return {
  "hedyhli/markdown-toc.nvim",
  ft = "markdown",  -- Lazy load on markdown filetype
  cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
  opts = {
    -- Your configuration here (optional)
  },
}
