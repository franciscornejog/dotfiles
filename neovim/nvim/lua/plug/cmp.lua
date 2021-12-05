return {
    'hrsh7th/nvim-cmp',
    config = function()
        vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
        local cmp = require('cmp')
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-u>'] = cmp.mapping.scroll_docs(4),
                ['<C-y>'] = cmp.mapping.complete(),
            },
            sources = {
                { name = 'nvim_lua' },
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'luasnip' },
                { name = 'buffer' },
            },
            formatting = {
                format = require('lspkind').cmp_format({
                    menu = ({
                        nvim_lua = '[lua]',
                        nvim_lsp = '[lsp]',
                        path = '[path]',
                        luasnip = '[snip]',
                        buffer = '[buffer]',
                    }),
                }),
            },
        })
    end,
}
