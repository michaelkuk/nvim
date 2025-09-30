return {
  "tpope/vim-fugitive",
  cmd = {
    "G",
    "Git",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "GMove",
    "GDelete",
    "GBrowse",
  },
  keys = {
    { "<leader>gS", "<cmd>Git<cr>", desc = "Git status (fugitive)" },
    { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff split" },
    { "<leader>gw", "<cmd>Gwrite<cr>", desc = "Git write (stage file)" },
    { "<leader>gr", "<cmd>Gread<cr>", desc = "Git read (checkout file)" },
    { "<leader>gm", "<cmd>GMove<cr>", desc = "Git move/rename" },
    { "<leader>gD", "<cmd>GDelete<cr>", desc = "Git delete" },
  },
}