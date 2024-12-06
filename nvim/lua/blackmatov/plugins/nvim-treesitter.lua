local nvim_treesitter_status, nvim_treesitter = pcall(require, "nvim-treesitter")
if not nvim_treesitter_status then
    print("nvim-treesitter not found")
    return
end

nvim_treesitter.setup()

local nvim_treesitter_configs_status, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not nvim_treesitter_configs_status then
    print("nvim-treesitter.configs not found")
    return
end

nvim_treesitter_configs.setup({
    ensure_installed = {
        "c",
        "cmake",
        "cpp",
        "json",
        "lua",
        "vim",
        "vimdoc",
        "xml",
        "zig",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    textobjects = {
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]]"] = "@function.outer",
            },
            goto_next_end = {
                ["]["] = "@function.outer",
            },
            goto_previous_start = {
                ["[["] = "@function.outer",
            },
            goto_previous_end = {
                ["[]"] = "@function.outer",
            },
        },
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ia"] = "@parameter.inner",
                ["aa"] = "@parameter.outer",
                ["ib"] = "@block.inner",
                ["ab"] = "@block.outer",
            },
        },
    },
})
