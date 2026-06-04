-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- nvim-web-devicons is omitted here; mini.icons mocks it (see custom/plugins/mini-icons.lua)
vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/s1n7ax/nvim-window-picker',
}

require('window-picker').setup {
  hint = 'floating-big-letter',
  selection_chars = 'FJDKSLA;CMRUEIWOQP',
  filter_rules = {
    include_current_win = false,
    autoselect_one = true,
    bo = {
      filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
      buftype = { 'terminal', 'quickfix' },
    },
  },
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

local neotree_width = 60

local function equalize_content_wins()
  vim.schedule(function()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.api.nvim_win_is_valid(win) then
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.api.nvim_get_option_value('filetype', { buf = buf })

        if ft == 'neo-tree' then
          vim.api.nvim_set_option_value('winfixwidth', true, { win = win })
          vim.api.nvim_win_set_width(win, neotree_width)
        end
      end
    end

    vim.cmd.wincmd '='
  end)
end

require('neo-tree').setup {
  close_if_last_window = true,
  open_files_using_window_picker = true,
  window = {
    position = 'right',
    width = neotree_width,
    mappings = {
      ['<space>'] = false,
    },
  },
  event_handlers = {
    { event = 'neo_tree_window_after_open', handler = equalize_content_wins },
    { event = 'neo_tree_window_after_close', handler = equalize_content_wins },
  },
  filesystem = {
    use_libuv_file_watcher = true,
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}
