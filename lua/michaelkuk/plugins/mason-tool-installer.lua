return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
  },
  opts = {
    ensure_installed = {
      "prettier", -- prettier formatter
      "stylua", -- lua formatter
      "eslint_d", -- js linter
    },
  },
}
