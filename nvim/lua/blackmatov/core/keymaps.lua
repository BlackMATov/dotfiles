vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap
local kmopts = { noremap = true, silent = true }

keymap.set("n", "<leader><CR>", ":nohl<CR>", kmopts)

keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>", kmopts)
keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", kmopts)

keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", kmopts)
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>", kmopts)
keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>", kmopts)
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", kmopts)
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", kmopts)
keymap.set("n", "<leader>fq", ":Telescope cmdline<CR>", kmopts)

keymap.set("n", "<leader>to", ":tabnew<CR>", kmopts)
keymap.set("n", "<leader>tx", ":tabclose<CR>", kmopts)
keymap.set("n", "<leader>tn", ":tabnext<CR>", kmopts)
keymap.set("n", "<leader>tp", ":tabprev<CR>", kmopts)

keymap.set("n", "<Up>", ":resize -2<CR>", kmopts)
keymap.set("n", "<Down>", ":resize +2<CR>", kmopts)
keymap.set("n", "<Left>", ":vertical resize -2<CR>", kmopts)
keymap.set("n", "<Right>", ":vertical resize +2<CR>", kmopts)

keymap.set("n", "<Tab>", ":bnext<CR>", kmopts)
keymap.set("n", "<S-Tab>", ":bprev<CR>", kmopts)
keymap.set("n", "<leader>b", ":enew<CR>", kmopts)
keymap.set("n", "<leader>x", ":bdelete!<CR>", kmopts)

keymap.set("n", "<C-k>", "<C-w>k", kmopts)
keymap.set("n", "<C-j>", "<C-w>j", kmopts)
keymap.set("n", "<C-h>", "<C-w>h", kmopts)
keymap.set("n", "<C-l>", "<C-w>l", kmopts)

keymap.set("n", "<leader>s", "<C-w>s", kmopts)
keymap.set("n", "<leader>v", "<C-w>v", kmopts)

keymap.set("v", "<", "<gv", kmopts)
keymap.set("v", ">", ">gv", kmopts)

keymap.set("n", "<leader>d", "\"_d", kmopts)
keymap.set("v", "<leader>d", "\"_d", kmopts)
keymap.set("x", "<leader>p", "\"_dP", kmopts)
