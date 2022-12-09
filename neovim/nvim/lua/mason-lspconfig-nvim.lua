return { 'williamboman/mason-lspconfig.nvim',
    requires = { 'neovim/nvim-lspconfig', 'simrat39/rust-tools.nvim', },
    config = function()
        vim.keymap.set('n', ' gd', vim.lsp.buf.definition)
        vim.keymap.set('n', ' gD', vim.lsp.buf.declaration)
        vim.keymap.set('n', ' gi', vim.lsp.buf.implementation)
        vim.keymap.set('n', ' gr', vim.lsp.buf.references)
        require('mason-lspconfig').setup({
            ensure_installed = {
                'apex_ls',
                'rust_analyzer',
                'sumneko_lua',
                'taplo',
            },
            automatic_installation = true,
        })
        require('mason-lspconfig').setup_handlers({
            function(server_name)
                require('lspconfig')[server_name].setup({})
            end,
            ['rust_analyzer'] = function()
                require('lspconfig').rust_analyzer.setup({
                    require('rust-tools').setup({})
                })
            end,
            ['sumneko_lua'] = function()
                require('lspconfig').sumneko_lua.setup({
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'hs', 'vim', 'it', 'describe' }
                            },
                        },
                    },
                })
            end,
        })
    end
}
