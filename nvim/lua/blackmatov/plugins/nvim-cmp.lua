local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    print("cmp not found")
    return
end

cmp.setup {
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
    },
    sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    }
}
