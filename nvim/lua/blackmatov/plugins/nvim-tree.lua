local nvimtree_status, nvimtree = pcall(require, "nvim-tree")
if not nvimtree_status then
    print("nvim-tree not found")
    return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    actions = {
        open_file = {
            resize_window = false
        }
    },
    git = {
        enable = false,
    },
    update_focused_file = {
        enable = true
    }
})
