local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
    print("telescope not found")
    return
end

telescope.setup()
telescope.load_extension("fzf")
