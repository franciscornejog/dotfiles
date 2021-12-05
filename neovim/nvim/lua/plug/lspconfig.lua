return {
    'neovim/nvim-lspconfig',
    config = function()
        local m = require('keymap')
        m.n(' vd', ':lua vim.lsp.buf.definition()<CR>')
        m.n(' vD', ':lua vim.lsp.buf.declaration()<CR>')
        m.n(' vi', ':lua vim.lsp.buf.implementation()<CR>')
        m.n(' vsh', ':lua vim.lsp.buf.signature_help()<CR>')
        m.n(' vrr', ':lua vim.lsp.buf.references()<CR>')
        m.n(' vrn', ':lua vim.lsp.buf.rename()<CR>')
        m.n(' vh', ':lua vim.lsp.buf.hover()<CR>')
        m.n(' vca', ':lua vim.lsp.buf.code_action()<CR>')
        m.n(' vds', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
        m.n(' vdn', ':lua vim.lsp.diagnostic.goto_next()<CR>')
        m.n(' vdp', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
        local installation_path = '/Users/fjcg/repositories/lua-language-server'
        local binary = installation_path .. '/bin/macOS/lua-language-server'
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
        require('lspconfig').sumneko_lua.setup({
            cmd = { binary, '-E', installation_path .. '/main.lua' },
            settings = {
                Lua = {
                    version = 'LuaJIT',
                    path = vim.split(package.path, ';'),
                    diagnostics = {
                        globals = { 'vim', 'hs' }, -- recognize globals
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                        },
                    },
                },
            },
            capabilities = capabilities
        })
    end,
}
