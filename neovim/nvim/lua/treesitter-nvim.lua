return { 'nvim-treesitter/nvim-treesitter', config = function()
    require('nvim-treesitter.configs').setup({
        ensure_installed = {
            'java',
            'lua',
            'rust',
        },
        highlight = { enable = true },
        playground = { enable = true },
    })
    require('nvim-treesitter.parsers').filetype_to_parsername.apexcode = 'java'
end, run = ':TSUpdate' }
