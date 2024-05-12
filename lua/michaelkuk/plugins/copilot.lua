return {
  "github/copilot.vim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.g.copilot_no_tab_map = false
  end,
}
