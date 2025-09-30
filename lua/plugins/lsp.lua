return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              preferences = {
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
                importModuleSpecifier = "non-relative",
              },
            },
          },
        },
        dartls = {
          cmd = { "dart", "language-server", "--protocol=lsp" },
          filetypes = { "dart" },
          init_options = {
            onlyAnalyzeProjectsWithOpenFiles = false,
            suggestFromUnimportedLibraries = true,
            closingLabels = true,
            outline = true,
            flutterOutline = true,
          },
          settings = {
            dart = {
              completeFunctionCalls = true,
              showTodos = true,
            },
          },
        },
      },
    },
  },
}
