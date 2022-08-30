local fn = vim.fn
local url = 'https://github.com/wbthomason/packer.nvim'
local path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(path)) > 0 then
    fn.system({'git', 'clone', '--depth=1', url, path})
end

local plugins = {
    require('packer-nvim'), -- package manager
    'nvim-lua/plenary.nvim', -- helper

    { 'williamboman/mason.nvim', config = require('mason').setup() },
    require('mason-lspconfig-nvim'),
    'neovim/nvim-lspconfig',
    'simrat39/rust-tools.nvim',

    require('cmp-nvim'), -- autocompletion
    'L3MON4D3/LuaSnip', -- snippet manager
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    'mfussenegger/nvim-dap', -- debugger
    'jose-elias-alvarez/null-ls.nvim', -- nvim as lsp

    require('telescope-nvim'), -- fuzzy finder
    require('treesitter-nvim'), -- syntax tree
    require('playground-nvim'), -- show syntax
    require('colorizer-nvim'), -- show colors
    { 'numToStr/Comment.nvim', config = require('Comment').setup() },
    { 'lewis6991/gitsigns.nvim', config = require('gitsigns').setup() },
    { 'kylechui/nvim-surround', config = require('nvim-surround').setup() },
    { 'franciscornejog/noired.nvim', config = vim.cmd('colorscheme noired') },
}

return require('packer').startup({ plugins })
