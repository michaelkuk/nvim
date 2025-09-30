return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- Override default find_files to always use workspace root
    {
      "<leader>ff",
      function()
        -- Look for yarn workspace root (yarn.lock or .git)
        local root = vim.fs.find({ "yarn.lock", ".git" }, { upward = true })[1]
        if root then
          root = vim.fn.fnamemodify(root, ":h")
        else
          root = vim.fn.getcwd()
        end
        require("telescope.builtin").find_files({ cwd = root })
      end,
      desc = "Find Files (Workspace Root)",
    },
    -- Also override live_grep to use consistent root
    {
      "<leader>fg",
      function()
        local root = vim.fs.find({ "yarn.lock", ".git" }, { upward = true })[1]
        if root then
          root = vim.fn.fnamemodify(root, ":h")
        else
          root = vim.fn.getcwd()
        end
        require("telescope.builtin").live_grep({ cwd = root })
      end,
      desc = "Live Grep (Workspace Root)",
    },
  },
}