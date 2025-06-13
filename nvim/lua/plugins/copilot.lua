-- GitHub Copilot plugin configuration
return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        -- Accept word by word in the suggestion
        -- Source: https://github.com/LazyVim/LazyVim/discussions/2109#discussioncomment-7738035
        accept_word = "<C-l>",
      },
    },
    filetypes = {
      ["."] = true,
    },
  },
}
