local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    print("lspconfig not found")
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    print("cmp_nvim_lsp not found")
    return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

if lspconfig.lua_ls then
    lspconfig.lua_ls.setup {
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
    }
end

if lspconfig.jsonls then
    lspconfig.jsonls.setup {
        capabilities = capabilities,
    }
end
