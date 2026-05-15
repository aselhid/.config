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
    local wins = vim.api.nvim_tabpage_list_wins(0)
    local content_wins = {}
    local has_neotree = false
    for _, win in ipairs(wins) do
      local ft = vim.api.nvim_get_option_value('filetype', { buf = vim.api.nvim_win_get_buf(win) })
      if ft == 'neo-tree' then
        has_neotree = true
      elseif ft ~= 'sidekick_terminal' then
        table.insert(content_wins, win)
      end
    end
    if #content_wins < 2 then
      return
    end
    local reserved = has_neotree and (neotree_width + 1) or 0
    local available = vim.o.columns - reserved - (#content_wins - 1)
    local per_win = math.floor(available / #content_wins)
    for _, win in ipairs(content_wins) do
      vim.api.nvim_win_set_width(win, per_win)
    end
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
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}
