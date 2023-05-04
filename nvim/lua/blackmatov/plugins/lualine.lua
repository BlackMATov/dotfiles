local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
    print("lualine not found")
    return
end

lualine.setup()
