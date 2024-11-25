local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
    print("telescope not found")
    return
end

telescope.setup {
    defaults = {
        layout_config = {
            width = 0.9,
            height = 0.9,
            preview_width = 0.5,
            prompt_position = "top",
        },
        sorting_strategy = "ascending",
    }
}

telescope.load_extension("fzf")
