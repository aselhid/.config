-- 1. Register and install the plugins via the native package manager
vim.pack.add {
  -- Icon support required by Trouble
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },

  -- Trouble.nvim itself
  { src = 'https://github.com/folke/trouble.nvim' },
}

-- 2. Basic initialization for the plugins
require('nvim-web-devicons').setup {}
require('trouble').setup {
  -- You can add custom trouble configurations here if desired
}

vim.keymap.set('n', '<leader>q', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Open auto-updating [Q]uickfix diagnostics' })
