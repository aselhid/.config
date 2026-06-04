vim.pack.add { 'https://github.com/folke/snacks.nvim' }

require('snacks').setup {
  indent = { enabled = true },
  lazygit = { enabled = true },
  picker = { enabled = true, ui_select = true },
}

vim.keymap.set('n', '<leader>bd', function() Snacks.bufdelete() end, { desc = '[B]uffer: [D]elete' })
vim.keymap.set('n', '<leader>bo', function() Snacks.bufdelete.other() end, { desc = '[B]uffer: [O]ther' })
vim.keymap.set('n', '<leader>bw', function() require('window-picker').pick_window() end, { desc = '[B]uffer: pick [W]indow' })
vim.keymap.set('n', '<leader>gg', function() Snacks.lazygit() end, { desc = '[G]it: open lazygit' })
vim.keymap.set('n', '<leader>gf', function() Snacks.lazygit.log_file() end, { desc = '[G]it: lazygit log (current file)' })
vim.keymap.set('n', '<leader>gl', function() Snacks.lazygit.log() end, { desc = '[G]it: lazygit log' })
