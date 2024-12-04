local vim = _G["vim"]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap
local kmopts = { noremap = true, silent = true }

keymap.set("i", "jk", "<Esc>", kmopts)

keymap.set("n", "n", "nzz", kmopts)
keymap.set("n", "N", "Nzz", kmopts)
keymap.set("n", "*", "*zz", kmopts)
keymap.set("n", "#", "#zz", kmopts)
keymap.set("n", "g*", "g*zz", kmopts)
keymap.set("n", "g#", "g#zz", kmopts)

keymap.set("n", "<Esc>", ":nohl<CR>", kmopts)
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", kmopts)

keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>", kmopts)
keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", kmopts)

keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", kmopts)
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>", kmopts)
keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>", kmopts)
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", kmopts)
keymap.set("n", "<leader>fq", ":Telescope cmdline<CR>", kmopts)
keymap.set("n", "<leader>fd", ":Telescope diagnostics<CR>", kmopts)
keymap.set("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", kmopts)
keymap.set("n", "<leader><leader>", ":Telescope buffers<CR>", kmopts)

keymap.set("n", "<leader>gb", ":Telescope git_bcommits<CR>", kmopts)
keymap.set("n", "<leader>gc", ":Telescope git_commits<CR>", kmopts)
keymap.set("n", "<leader>gs", ":Telescope git_status<CR>", kmopts)

keymap.set("n", "<leader>lh", vim.lsp.buf.hover, kmopts)
keymap.set("n", "<leader>ln", vim.lsp.buf.rename, kmopts)
keymap.set("n", "<leader>ld", ":Telescope lsp_definitions<CR>", kmopts)
keymap.set("n", "<leader>li", ":Telescope lsp_implementations<CR>", kmopts)
keymap.set("n", "<leader>lr", ":Telescope lsp_references<CR>", kmopts)
keymap.set("n", "<leader>ls", ":Telescope lsp_document_symbols<CR>", kmopts)
keymap.set("n", "<leader>lt", ":Telescope lsp_type_definitions<CR>", kmopts)
keymap.set("n", "<leader>lw", ":Telescope lsp_workspace_symbols<CR>", kmopts)

keymap.set("n", "[c", ":Gitsigns prev_hunk<CR>", kmopts)
keymap.set("n", "]c", ":Gitsigns next_hunk<CR>", kmopts)

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
keymap.set("n", "<leader>x", ":b#<bar>bd#<CR>", kmopts)

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

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('blackmatov-highlight-yank', { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})
