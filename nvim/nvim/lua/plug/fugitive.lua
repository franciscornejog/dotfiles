return {
    'tpope/vim-fugitive',
    config = function()
        vim.opt.statusline = '%<%f %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%) %P'
    end
}

