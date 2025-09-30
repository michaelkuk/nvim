return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      window = {
        position = "float", -- This makes it a floating window
        enter_insert = true, -- Enter insert mode when opening
        hide_numbers = true,
        hide_signcolumn = true,

        -- Floating window configuration
        float = {
          width = "80%", -- Adjust size as needed
          height = "80%", -- Adjust size as needed
          row = "center", -- Center vertically
          col = "center", -- Center horizontally
          relative = "editor",
          border = "rounded", -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
        },
      },
    })
  end,
}
