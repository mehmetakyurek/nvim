return {
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    enabled = false,
    config = function()
      require('lsp_signature').setup({
        bind = true,
        floating_window = true,
        hint_enable = false, -- Disable inline hints
        floating_window_above_cur_line = true,
        floating_window_off_x = function()
          return vim.api.nvim_win_get_cursor(0)[2]
        end,
        floating_window_off_y = -1,
        handler_opts = {
          border = "rounded"
        },

      })
    end,
  },
}
