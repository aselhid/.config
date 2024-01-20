return {
  { "mini.surround", enabled = false },
  { "nvim-treesitter/nvim-treesitter-context", enabled = false },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "folke/flash.nvim",
    keys = {
      -- disable the default flash keymap
      { "S", mode = { "n", "o", "x" }, false },
    },
  },
}
