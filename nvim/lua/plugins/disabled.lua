return {
  { "mini.surround", enabled = false },
  { "nvim-treesitter/nvim-treesitter-context", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
    keys = {
      -- disable the default flash keymap
      { "S", mode = { "n", "o", "x" }, false },
    },
  },
}
