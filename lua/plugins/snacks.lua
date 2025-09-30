return {
  {
    "folke/snacks.nvim",
    -- Merge in your overrides:
    opts = {
      picker = {
        -- This makes *all* Snacks pickers (including the explorer) show hidden files:
        hidden = true, -- show dotfiles
        ignored = true, -- show files normally ignored by .gitignore
        -- If you only want it for the file-tree explorer (and not e.g. for 'files' or 'git_files'),
        -- you can target just that source:
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
