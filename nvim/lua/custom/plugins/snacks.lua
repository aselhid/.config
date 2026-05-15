vim.pack.add { 'https://github.com/folke/snacks.nvim' }

require('snacks').setup {
  indent = { enabled = true },
  lazygit = { enabled = true },
  picker = { enabled = true, ui_select = true },
}

vim.keymap.set('n', '<leader>gg', function() Snacks.lazygit() end, { desc = '[G]it: open lazygit' })
vim.keymap.set('n', '<leader>gf', function() Snacks.lazygit.log_file() end, { desc = '[G]it: lazygit log (current file)' })
vim.keymap.set('n', '<leader>gl', function() Snacks.lazygit.log() end, { desc = '[G]it: lazygit log' })
