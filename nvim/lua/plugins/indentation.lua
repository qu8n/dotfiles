-- Smart indentation that automatically adjusts to the current file
return {
  -- Fastest & "dumbest" option
  -- Looks at the 1st indentation in file and uses that to guess the indentation
  -- "Darazaki/indent-o-matic",

  -- Middle ground option
  -- Looks at the first few 100 lines of the file to guess the indentation
  "nmac427/guess-indent.nvim",

  -- Slowest & smartest option
  -- Looks at the current file or other files in the same directory
  -- "tpope/vim-sleuth",
}
