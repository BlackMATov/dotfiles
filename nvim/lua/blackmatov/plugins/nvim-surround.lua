local nvim_surround_status, nvim_surround = pcall(require, "nvim-surround")
if not nvim_surround_status then
    print("nvim-surround not found")
    return
end

nvim_surround.setup()
