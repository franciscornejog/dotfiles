return { 'nvim-treesitter/nvim-treesitter', config = function()
    require('nvim-treesitter.configs').setup({
        ensure_installed = {
            'css',
            'go',
            'html',
            'java',
            'javascript',
            'lua',
            'markdown',
            'markdown_inline',
            'python',
            'query',
            'rust',
            'svelte',
            'yaml',
            'toml',
            'typescript',
        },
        auto_install = true,
        highlight = { enable = true },
        playground = { enable = true },
    })
    require('nvim-treesitter.parsers').filetype_to_parsername.apexcode = 'java'
end, run = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()
end }
