vim.g.mapleader = '\\'

local keymap = vim.keymap

keymap.set("n", "<leader><CR>", ":nohl<CR>")
keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")

keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")

keymap.set("n", "<S-Left>", "<C-W>h")
keymap.set("n", "<S-Right>", "<C-W>l")
keymap.set("n", "<S-Up>", "<C-W>k")
keymap.set("n", "<S-Down>", "<C-W>j")

keymap.set("n", "<leader>s", "<C-W>s")
keymap.set("n", "<leader>v", "<C-W>v")
