vim.pack.add { 'https://github.com/MagicDuck/grug-far.nvim' }

local grug_far = require 'grug-far'

grug_far.setup {}

vim.keymap.set({ 'n', 'x' }, '<leader>sr', function() grug_far.open() end, { desc = '[S]earch and [R]eplace' })
vim.keymap.set({ 'n', 'x' }, '<leader>sF', function()
  grug_far.open { prefills = { paths = vim.fn.expand '%' } }
end, { desc = '[S]earch and replace current [F]ile' })
vim.keymap.set({ 'n', 'x' }, '<leader>si', function()
  grug_far.open { visualSelectionUsage = 'operate-within-range' }
end, { desc = '[S]earch and replace w[I]thin range' })
