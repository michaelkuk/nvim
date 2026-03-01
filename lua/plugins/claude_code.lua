return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      window = {
        position = "float",
        enter_insert = true,
        hide_numbers = true,
        hide_signcolumn = true,
        float = {
          width = "80%",
          height = "80%",
          row = "center",
          col = "center",
          relative = "editor",
          border = "rounded",
        },
      },
    })
  end,
}
