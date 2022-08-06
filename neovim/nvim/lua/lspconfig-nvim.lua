return { 'neovim/nvim-lspconfig', config = function()
    vim.keymap.set('n', ' gd', ':lua vim.lsp.buf.definition()<cr>')
    vim.keymap.set('n', ' gD', ':lua vim.lsp.buf.declaration()<cr>')
    vim.keymap.set('n', ' gi', ':lua vim.lsp.buf.implementation()<cr>')
    vim.keymap.set('n', ' gr', ':lua vim.lsp.buf.references()<cr>')
    vim.keymap.set('n', ' rr', ':lua vim.lsp.buf.rename()<cr>')
    vim.keymap.set('n', ' ra', ':lua vim.lsp.buf.code_action()<cr>')
    vim.keymap.set('n', ' gn', ':lua vim.lsp.diagnostic.goto_next()<cr>')
    vim.keymap.set('n', ' gp', ':lua vim.lsp.diagnostic.goto_prev()<cr>')
    local installation_path = vim.fn.expand('$HOME') .. '/homebrew/Cellar/lua-language-server/3.5.1/libexec'
    local binary = installation_path .. '/bin/lua-language-server'
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
    require('lspconfig').svelte.setup({})
    require('lspconfig').apex_ls.setup({
        apex_jar_path = '/Users/franciscocornejogarcia/apex-jorje-lsp.jar',
        apex_enable_semantic_errors = false,
        apex_enable_completion_statistics = false,
    })
    require('lspconfig').sumneko_lua.setup({
        cmd = { binary, '-E', installation_path .. '/main.lua' },
        settings = {
            Lua = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
                diagnostics = {
                    globals = { 'vim', 'hs' },
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
end }
