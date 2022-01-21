local fn = vim.fn
local installPath = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(installPath)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/wbthomason/packer.nvim', installPath})
end

return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim',
        config = function()
            vim.keymap.set('n', ' ps', ':PackerSync<cr>')
        end }
    use 'franciscornejog/noired.nvim'
    use 'nvim-lua/plenary.nvim'
    use { 'norcalli/nvim-colorizer.lua',
        config = function()
            vim.keymap.set('n', ' ct', ':ColorizerToggle<cr>')
        end }
    use { 'nvim-telescope/telescope.nvim',
        config = function()
            vim.keymap.set('n', ' ff', ":lua require('telescope.builtin').find_files()<cr>")
            vim.keymap.set('n', ' fb', ":lua require('telescope.builtin').file_browser()<cr>")
            vim.keymap.set('n', ' fg', ":lua require('telescope.builtin').live_grep()<cr>")
            vim.keymap.set('n', ' gf', ":lua require('telescope.builtin').git_files()<cr>")
            vim.keymap.set('n', ' vb', ":lua require('telescope.builtin').buffers()<cr>")
            vim.keymap.set('n', ' vh', ":lua require('telescope.builtin').help_tags()<cr>")
            vim.keymap.set('n', ' vk', ":lua require('telescope.builtin').keymaps()<cr>")
            vim.keymap.set('n', ' vl', ":lua require('telescope.builtin').highlights()<cr>")
        end }
    use { 'nvim-treesitter/nvim-treesitter',
        config = function()
            local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
            parser_configs.norg = { -- brew install gcc / CC=gcc-11 nvim -c "TSInstall norg"
                install_info = {
                    url = 'https://github.com/nvim-neorg/tree-sitter-norg',
                    files = { 'src/parser.c', 'src/scanner.cc' },
                    branch = 'main'
                },
            }
            parser_configs.norg_meta = {
                install_info = {
                    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
                    files = { "src/parser.c" },
                    branch = "main"
                },
            }
            parser_configs.norg_table = {
                install_info = {
                    url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
                    files = { "src/parser.c" },
                    branch = "main"
                },
            }

            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'lua', 'rust', 'markdown' },
                highlight = { enable = true },
                incremental_selection = { enable = true },
                indent = { enable = true },
                query_linter = {
                    enable = true,
                    use_virtual_text = true,
                    lint_events = { 'BufWrite', 'CursorHold' },
                },
                playground = { enable = true },
            })
        end,
        run = ':TSUpdate' }
    use { 'nvim-treesitter/playground',
        config = function()
            vim.keymap.set('n', ' tt', ':TSPlaygroundToggle<cr>')
            vim.keymap.set('n', ' tl', ':TSHighlightCapturesUnderCursor<cr>')
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
            vim.keymap.set('n', ' vd', ':lua vim.lsp.buf.definition()<CR>')
            vim.keymap.set('n', ' vD', ':lua vim.lsp.buf.declaration()<CR>')
            vim.keymap.set('n', ' vi', ':lua vim.lsp.buf.implementation()<CR>')
            vim.keymap.set('n', ' vsh', ':lua vim.lsp.buf.signature_help()<CR>')
            vim.keymap.set('n', ' vrr', ':lua vim.lsp.buf.references()<CR>')
            vim.keymap.set('n', ' vrn', ':lua vim.lsp.buf.rename()<CR>')
            vim.keymap.set('n', ' vh', ':lua vim.lsp.buf.hover()<CR>')
            vim.keymap.set('n', ' vca', ':lua vim.lsp.buf.code_action()<CR>')
            vim.keymap.set('n', ' vds', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
            vim.keymap.set('n', ' vdn', ':lua vim.lsp.diagnostic.goto_next()<CR>')
            vim.keymap.set('n', ' vdp', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
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
    -- use 'mfussenegger/nvim-jdtls'
end)
