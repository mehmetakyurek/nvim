return {
  'pcolladosoto/tinygo.nvim',
  enabled = function()
    return vim.fn.executable('tinygo') == 1
  end,
  config = function()
    require('tinygo').setup()
  end,
}
