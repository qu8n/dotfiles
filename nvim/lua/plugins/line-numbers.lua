-- Display both absolute and relative line numbers
return {
  "qu8n/line-numbers.nvim",
  branch = "add-current-line-highlight",
  opts = {
    abs_highlight = { fg = "#B2B2B2" },
    current_abs_highlight = { bold = true },
    current_rel_highlight = { fg = "#8C8C8C", bold = true },
  },
}
