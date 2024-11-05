-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" }) -- pane jump left
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" }) -- pane jump right
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" }) -- pane jump down
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" }) -- pane jump up

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<leader>x", "<cmd>bd %<CR>", { desc = "Kill current buffer" })

keymap.set("n", "<leader>nn", "<Plug>(neorg.dirman.new-note)", { desc = "Create a new note" })
