return {
  "3rd/diagram.nvim",
  dependencies = {
    "3rd/image.nvim",
  },
  cond = function()
    return vim.fn.executable("magick") == 1 and os.getenv("TERM_PROGRAM") ~= nil
  end,
  opts = { -- you can just pass {}, defaults below
    renderer_options = {
      mermaid = {
        background = "white", -- nil | "transparent" | "white" | "#hex"
        theme = "dark", -- nil | "default" | "dark" | "forest" | "neutral"
        scale = 1, -- nil | 1 (default) | 2  | 3 | ...
        width = 800, -- nil | 800 | 400 | ...
        height = 600, -- nil | 600 | 300 | ...
      },
      plantuml = {
        charset = nil,
      },
      d2 = {
        theme_id = nil,
        dark_theme_id = nil,
        scale = nil,
        layout = nil,
        sketch = nil,
      },
      gnuplot = {
        size = nil, -- nil | "800,600" | ...
        font = nil, -- nil | "Arial,12" | ...
        theme = nil, -- nil | "light" | "dark" | custom theme string
      },
    },
  },
}
