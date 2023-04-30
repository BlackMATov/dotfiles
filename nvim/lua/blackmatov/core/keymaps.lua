vim.g.mapleader = '\\'

local keymap = vim.keymap

keymap.set("n", "<leader><CR>", ":nohl<CR>")
keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")

keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
