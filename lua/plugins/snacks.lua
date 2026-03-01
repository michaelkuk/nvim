return {
  {
    "folke/snacks.nvim",
    -- Merge in your overrides:
    opts = {
      picker = {
        -- This makes *all* Snacks pickers (including the explorer) show hidden files:
        hidden = true, -- show dotfiles
        ignored = true, -- show files normally ignored by .gitignore
        -- Configure all picker sources to default to project root instead of cwd
        sources = {
          grep = {
            ignored = false,
            config = function(opts)
              if not opts.cwd then
                opts.cwd = LazyVim.root.get({ normalize = true })
              end
              return opts
            end,
          },
          files = {
            config = function(opts)
              if not opts.cwd then
                opts.cwd = LazyVim.root.get({ normalize = true })
              end
              return opts
            end,
          },
          recent = {
            config = function(opts)
              if not opts.cwd and not opts.filter then
                -- Only set cwd for recent files if not already filtered by cwd
                opts.cwd = LazyVim.root.get({ normalize = true })
              end
              return opts
            end,
          },
        },
      },
      explorer = {
        -- Additional explorer-specific configuration
        width = 40,
        actions = {
          -- Custom action to prevent going above workspace root
          ["cd_up"] = {
            desc = "Change Directory Up (Restricted)",
            action = function(ctx)
              -- Find workspace root
              local workspace_root = vim.fs.find({ "yarn.lock", ".git" }, { upward = true })[1]
              if workspace_root then
                workspace_root = vim.fn.fnamemodify(workspace_root, ":h")
              else
                workspace_root = vim.fn.getcwd()
              end

              -- Get parent directory
              local current = ctx.cwd or vim.fn.getcwd()
              local parent = vim.fn.fnamemodify(current, ":h")

              -- Only allow cd up if we're not at or above workspace root
              if vim.startswith(parent, workspace_root) and parent ~= workspace_root then
                vim.cmd("cd " .. parent)
                ctx.refresh()
              else
                vim.notify("Cannot navigate above workspace root: " .. workspace_root, vim.log.levels.WARN)
              end
            end,
          },
        },
      },
    },
  },
}
