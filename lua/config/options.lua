-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Fix Telescope root detection for yarn workspaces
-- Prioritize yarn.lock and .git over LSP root directories
vim.g.root_spec = { { "yarn.lock", ".git", "package.json" }, "lsp", "cwd" }

-- Optional: Ignore specific LSP servers that report incorrect roots in yarn workspaces
-- Uncomment and adjust as needed:
-- vim.g.root_lsp_ignore = { "typescript-language-server", "eslint" }
