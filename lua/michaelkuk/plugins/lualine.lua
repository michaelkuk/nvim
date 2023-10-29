return {
  'nvim-lualine/lualine.nvim',
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  depencies = {
    { 'nvim-tree/nvim-web-devicons' },
  },
  opts = {}
}