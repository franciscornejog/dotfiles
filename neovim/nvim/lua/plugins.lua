local fn = vim.fn
local installPath = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(installPath)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/wbthomason/packer.nvim', installPath})
end

return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim',
        config = function()
            vim.keymap.set('n', ' rs', ':PackerSync<cr>')
        end }
    use 'franciscornejog/noired.nvim'
    use 'nvim-lua/plenary.nvim'
    use { 'norcalli/nvim-colorizer.lua',
        config = function()
            vim.keymap.set('n', ' tc', ':ColorizerToggle<cr>')
        end }
    use { 'nvim-telescope/telescope.nvim',
        config = function()
            vim.keymap.set('n', ' sf', ":lua require('telescope.builtin').find_files()<cr>")
            vim.keymap.set('n', ' st', ":lua require('telescope.builtin').live_grep()<cr>")
            vim.keymap.set('n', ' sg', ":lua require('telescope.builtin').git_files()<cr>")
            vim.keymap.set('n', ' sb', ":lua require('telescope.builtin').buffers()<cr>")
            vim.keymap.set('n', ' sk', ":lua require('telescope.builtin').keymaps()<cr>")
            vim.keymap.set('n', ' sh', ":lua require('telescope.builtin').highlights()<cr>")
        end }
    use { 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'lua', 'rust', 'markdown' },
                highlight = { enable = true },
                playground = { enable = true },
            })
        end,
        run = ':TSUpdate' }
    use { 'nvim-treesitter/playground',
        config = function()
            vim.keymap.set('n', ' tp', ':TSPlaygroundToggle<cr>')
            vim.keymap.set('n', ' ph', ':TSHighlightCapturesUnderCursor<cr>')
        end }
    use { 'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end }
    use 'L3MON4D3/LuaSnip' -- snippet manager
    use 'saadparwaiz1/cmp_luasnip' -- source for luasnip
    use 'hrsh7th/cmp-nvim-lsp' -- source for neovim lsp
    use 'hrsh7th/cmp-nvim-lua' -- source for neovim lua api
    use { 'hrsh7th/nvim-cmp',
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
    use { 'neovim/nvim-lspconfig',
        config = function()
            vim.keymap.set('n', ' gd', ':lua vim.lsp.buf.definition()<cr>')
            vim.keymap.set('n', ' gD', ':lua vim.lsp.buf.declaration()<cr>')
            vim.keymap.set('n', ' gi', ':lua vim.lsp.buf.implementation()<cr>')
            vim.keymap.set('n', ' gr', ':lua vim.lsp.buf.references()<cr>')
            vim.keymap.set('n', ' rr', ':lua vim.lsp.buf.rename()<cr>')
            vim.keymap.set('n', ' ra', ':lua vim.lsp.buf.code_action()<cr>')
            vim.keymap.set('n', ' gn', ':lua vim.lsp.diagnostic.goto_next()<cr>')
            vim.keymap.set('n', ' gp', ':lua vim.lsp.diagnostic.goto_prev()<cr>')
            local installation_path = '/usr/local/Cellar/lua-language-server/2.5.3/libexec'
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
        end }
    use { 'simrat39/rust-tools.nvim',
        config = function()
            require('rust-tools').setup()
        end }
    use { 'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end }
    use { '~/Documents/projects/test-plugin',
        config = function()
            require('test-plugin').setup()
            vim.keymap.set('n', ' rt', ":lua require('test-plugin').test()<cr>")
        end }
    -- use 'mfussenegger/nvim-jdtls'
end)
