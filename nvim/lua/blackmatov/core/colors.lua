local colorscheme_status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not colorscheme_status then
    print("colorscheme not found!")
    return
end
