local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    print("cmp_nvim_lsp not found")
    return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local vim = _G["vim"]

-- lua_ls

vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
        Lua = {
            completion = {
                autoRequire = false,
            },
            runtime = {
                pathStrict = true,
                version = "LuaJIT",
            }
        }
    },
})
vim.lsp.enable('lua_ls')

-- jsonls

vim.lsp.config('jsonls', {
    capabilities = capabilities,
})
vim.lsp.enable('jsonls')
