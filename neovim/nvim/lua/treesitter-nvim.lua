return { 'nvim-treesitter/nvim-treesitter', config = function()
    require('nvim-treesitter.configs').setup({
        ensure_installed = { 'java', 'lua', 'rust', 'markdown', 'html', 'css', 'javascript', 'typescript', 'vim', 'svelte', 'json', 'toml', 'yaml', 'vim' },
        highlight = { enable = true },
        playground = { enable = true },
    })
    local ft_to_parser = require('nvim-treesitter.parsers').filetype_to_parsername
    ft_to_parser.apexcode = 'java'
end,
run = ':TSUpdate' }

