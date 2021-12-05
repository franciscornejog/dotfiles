return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = "all",
            ignore_install = { "haskell" },
            highlight = { enable = { "lua" } },
            playground = { enable = true },
        })
        local m = require('keymap')
        m.n(' tt', ":lua require('nvim-treesitter-playground.internal').toggle()<cr>")
        m.n(' tl', ":lua require('nvim-treesitter-playground.hl-info').show_hl_captures()<cr>")
    end,
    run = ':TSUpdate'
}

