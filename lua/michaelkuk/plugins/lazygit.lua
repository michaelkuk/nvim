return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").load_extension("lazygit")

    vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", {})
  end,
}
