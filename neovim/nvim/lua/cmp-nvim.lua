return { 'hrsh7th/nvim-cmp', config = function()
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
            { name = 'luasnip' },
            { name = 'neorg' },
        },
        formatting = {
            format = function(entry, vim_item)
                vim_item.menu = ({
                    nvim_lua = '[lua]',
                    nvim_lsp = '[lsp]',
                    luasnip = '[snip]',
                })[entry.source.name]
                return vim_item
            end
        },
    })
end }
