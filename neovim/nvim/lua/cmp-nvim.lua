return { 'hrsh7th/nvim-cmp', config = function()
    vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
    local cmp = require('cmp')
    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-u>'] = cmp.mapping.scroll_docs(4),
            ['<C-e>'] = cmp.mapping.confirm(),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lua' },
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
            { name = 'cmdline' },
        }),
        formatting = {
            format = function(entry, vim_item)
                vim_item.menu = ({
                    buffer ='[buf]',
                    nvim_lua = '[lua]',
                    nvim_lsp = '[lsp]',
                    luasnip = '[snip]',
                    path = '[path]',
                    cmdline = '[cmd]',
                })[entry.source.name]
                return vim_item
            end
        },
    })
end }
