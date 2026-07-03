vim.pack.add { 'https://github.com/nvim-zh/colorful-winsep.nvim' }

require('colorful-winsep').setup {
  border = 'single',
  animate = {
    enabled = false,
  },
}
