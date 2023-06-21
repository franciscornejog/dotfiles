return { 'neovim/nvim-lspconfig',
    requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'simrat39/rust-tools.nvim', },
    config = function()
        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap(' gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap(' gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap(' gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            nmap(' gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        local servers = {
            -- apex_ls = {}, -- Salesforce
            cssls = {},
            gopls = {},
            html = {},
            jdtls = {}, -- Java
            lua_ls = {
                Lua = {
                    diagnostics = {
                        globals = { 'hs', 'vim', 'it', 'describe' }
                    },
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
            omnisharp = {},
            pylsp = {},
            rust_analyzer = { require('rust-tools').setup({}) },
            taplo = {},
            tsserver = {},
            svelte = {},
        }
        require('mason').setup()
        local mason_lspconfig = require('mason-lspconfig')
        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
            automatic_installation = true,
        })
        mason_lspconfig.setup_handlers({
            function(server_name)
                require('lspconfig')[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                })
            end,
            ['jdtls'] = function()
                require('lspconfig').jdtls.setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    root_dir = require('lspconfig').util.root_pattern('pom.xml', 'build.gradle', '.git') or vim.fn.getcwd(),
                })
            end,
        })
    end
}
