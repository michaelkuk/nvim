return {
  'fgheng/winbar.nvim',
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    enabled = true,
  },
}