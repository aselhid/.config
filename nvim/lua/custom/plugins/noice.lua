vim.pack.add { 'https://github.com/MunifTanjim/nui.nvim' }
vim.pack.add { 'https://github.com/folke/noice.nvim' }

require('noice').setup {
  notify = {
    backend = 'mini',
  },
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
    },
    progress = { enabled = false }, -- keep fidget for LSP progress
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    lsp_doc_border = true,
  },
}

vim.keymap.set('n', '<leader>nd', function() require('noice').cmd('dismiss') end, { desc = '[N]oice: [D]ismiss all' })
vim.keymap.set('n', '<leader>nh', function() require('noice').cmd('history') end, { desc = '[N]oice: message [H]istory' })
