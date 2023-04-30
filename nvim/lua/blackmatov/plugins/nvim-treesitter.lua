local nvim_treesitter_status, nvim_treesitter = pcall(require, "nvim-treesitter")
if not nvim_treesitter_status then
    return
end

nvim_treesitter.setup()

local nvim_treesitter_configs_status, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not nvim_treesitter_configs_status then
    return
end

nvim_treesitter_configs.setup({
    ensure_installed = {
        "c",
        "cmake",
        "cpp",
        "lua",
        "vim",
        "vimdoc",
        "zig",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
