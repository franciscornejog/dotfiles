return { 'nvim-treesitter/nvim-treesitter', config = function()
    require('nvim-treesitter.configs').setup({
        ensure_installed = {
            'css',
            'html',
            'java',
            'javascript',
            'lua',
            'rust',
            'svelte',
            'toml',
            'typescript',
        },
        highlight = { enable = true },
        playground = { enable = true },
    })
    require('nvim-treesitter.parsers').filetype_to_parsername.apexcode = 'java'
end, run = ':TSUpdate' }
