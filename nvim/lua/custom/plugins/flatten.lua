return {
  'willothy/flatten.nvim',
  -- load before anything else so nested nvim calls are intercepted early
  lazy = false,
  priority = 1001,
  opts = {
    window = {
      -- open files from lazygit in a vsplit
      open = 'vsplit',
    },
    block_for = {
      -- block lazygit until the opened file buffer is closed
      gitcommit = true,
    },
    hooks = {
      post_open = function(bufnr, winnr, ft, is_blocking)
        if is_blocking then
          -- for blocking calls (e.g. git commit editor), focus the window
          vim.api.nvim_set_current_win(winnr)
        else
          -- for non-blocking, bring snacks lazygit terminal to the background
          -- by switching focus to the newly opened buffer window
          vim.api.nvim_set_current_win(winnr)
        end
      end,
      block_end = function()
        -- after a blocking call completes, return focus to lazygit
        -- snacks terminal will still be open in the background
      end,
    },
  },
}
