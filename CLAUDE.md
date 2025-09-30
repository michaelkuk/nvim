# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LazyVim-based Neovim configuration built on the lazy.nvim plugin manager. The configuration follows LazyVim's modular plugin architecture where plugins are defined in separate files within `lua/plugins/` and configuration is structured under `lua/config/`.

## Commands

### Code Formatting
- `stylua .` - Format Lua files according to stylua.toml configuration (2 spaces, 120 column width)

### Plugin Management
- `:Lazy` - Open Lazy.nvim plugin manager interface
- `:Lazy sync` - Update all plugins
- `:Lazy clean` - Remove unused plugins

### LazyVim Management
- `:LazyExtras` - Manage LazyVim extras (language support, formatters, etc.)

## Architecture

### Core Structure

- **init.lua**: Entry point that bootstraps lazy.nvim and requires config/lazy.lua
- **lua/config/**: Core configuration files
  - **lazy.lua**: Main plugin specification and lazy.nvim setup
  - **keymaps.lua**: Custom key mappings (extends LazyVim defaults)
  - **options.lua**: Neovim options (extends LazyVim defaults)
  - **autocmds.lua**: Autocommands
- **lua/plugins/**: Custom plugin configurations that override or extend LazyVim

### Plugin System

The configuration uses LazyVim's two-tier plugin system:
1. **LazyVim plugins**: Base plugins imported via `{ "LazyVim/LazyVim", import = "lazyvim.plugins" }`
2. **Custom plugins**: Located in `lua/plugins/`, automatically imported via `{ import = "plugins" }`

Custom plugins can:
- Override LazyVim defaults by returning a table with the same plugin name
- Add completely new plugins
- Extend existing plugin configurations

### LazyVim Extras

Configured extras in lazyvim.json include:
- Languages: TypeScript, Python, C/C++, CMake, Docker, Git, JSON, Markdown, YAML, Zig, Erlang, Helm, Toml, Tailwind
- Tools: DAP debugging, Harpoon2, Overseer, Prettier formatting, ESLint linting, REST client

### Key Custom Plugins

- **claude-code.nvim**: Claude Code integration with 80% floating window, centered, rounded border (lua/plugins/claude_code.lua)
- **LSP configurations**: Custom TypeScript/VTSLS settings with non-relative imports and Dart LSP with completion features (lua/plugins/lsp.lua)
- **GitLab.nvim**: GitLab integration with insecure connections enabled for self-hosted instances (lua/plugins/gitlab.lua)
- **Snacks.nvim**: Enhanced file explorer showing hidden/ignored files with workspace root boundary protection (lua/plugins/snacks.lua)
- **Flutter tools**: Comprehensive Flutter development configuration (currently commented out in lua/plugins/flutter.lua)
- **Fugitive**: Git integration (lua/plugins/fugitive.lua)

### Configuration Files

- **.neoconf.json**: Neoconf settings for Lua language server with neodev integration
- **stylua.toml**: Code formatting rules (2 spaces, 120 columns)
- **lazyvim.json**: LazyVim extras configuration and version tracking
- **lazy-lock.json**: Plugin version lockfile (auto-generated)

## Development Guidelines

### Adding New Plugins

Create a new file in `lua/plugins/` that returns a plugin specification table. Use existing files as templates and follow LazyVim plugin structure.

### Modifying Existing Plugins

To override LazyVim defaults, create a plugin file with the same plugin name and specify only the options you want to change.

### Key Mappings

Custom keymaps go in `lua/config/keymaps.lua`. Use `LazyVim.safe_keymap_set` function for consistency.

Current custom mappings:
- `<leader>fs` - Find string in current working directory via Telescope live_grep

### Language Support

Language support is primarily managed through LazyVim extras in lazyvim.json. For custom language configurations, create plugin overrides in `lua/plugins/`.

### Workspace Root Detection

The configuration has custom root detection logic that prioritizes project markers for monorepos and yarn workspaces:

```lua
vim.g.root_spec = { { "yarn.lock", ".git", "package.json" }, "lsp", "cwd" }
```

This ensures correct workspace boundaries in `lua/config/options.lua:7`. The Snacks file explorer also prevents navigation above the detected workspace root.