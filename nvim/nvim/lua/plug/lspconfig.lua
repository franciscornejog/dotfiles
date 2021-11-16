return {
    'neovim/nvim-lspconfig',
    config = function() 
        local installation_path = '/Users/fjcg/repositories/lua-language-server'
        local binary = installation_path .. '/bin/macOS/lua-language-server'
        local runtime_path = vim.split(package.path, ';')
        -- table.insert(runtime_path, 'lua/?.lua')
        -- table.insert(runtime_path, 'lua/?/init.lua')
        require('lspconfig').sumneko_lua.setup {
            cmd = { binary, '-E', installation_path .. '/main.lua' },
            settings = {
                Lua = {
                    version = 'LuaJIT',
                    path = runtime_path,
                },
                diagnostics = {
                    globals = { 'vim' }, -- recognize 'vim' global
                },
                workspace = {
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    },
                },
            },
        }
    end,
}
