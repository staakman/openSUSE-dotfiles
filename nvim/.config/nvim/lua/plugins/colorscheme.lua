return {
  -- 1. Add the Dracula theme plugin
  { "staakman/dracula.nvim" },

  -- 2. Tell LazyVim to use it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
