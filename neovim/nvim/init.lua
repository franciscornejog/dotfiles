-- Personal Neovim Configuration
-- Author:  Francisco Cornejo-Garcia (franciscornejog)

-- [[ Global Variables ]]
vim.g.mapleader = " "                     -- set global map leader

-- [[ Options ]] 'option-list'
vim.opt.breakindent = true                -- enable break indent
vim.opt.expandtab = true                  -- turn tab to spaces
vim.opt.shiftwidth = 4                    -- indent with spaces
vim.opt.softtabstop = 4                   -- set soft tab width

vim.opt.number = true                     -- enable line numbers
vim.opt.signcolumn = 'no'                 -- enable extra column to prevent shifting

vim.opt.clipboard:append {'unnamedplus'}  -- sync clipboard between OS and Neovim
vim.opt.undofile = true                   -- save undo history outside editor

vim.opt.inccommand = 'split'              -- see substitutions in preview window
vim.opt.wildoptions:append {'fuzzy'}      -- allow fuzzy matching in wildmenu
vim.opt.ignorecase = true                 -- ignore case when searching

vim.diagnostic.config {
  jump = { float = true },
  float = { header = '', signs = false },
}

-- [[ Keymaps ]]
vim.keymap.set('n', 'gS', '<cmd>source %<cr>', { desc = 'User: Source current file' })

-- [[ User Interface ]]
vim.api.nvim_create_augroup('UserGroup', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = 'UserGroup',
  desc = 'Highlight when yanking (copying) text',
  callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = 'UserGroup',
  desc = 'Set local option based on filetype',
  pattern = 'lua',
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
  end,
})

-- [[ LSP ]]
vim.opt.completeopt:append {'menuone', 'fuzzy', 'noselect', 'preview'}
vim.api.nvim_create_autocmd('LspAttach', {
  group = 'UserGroup',
  callback = function(args)
    vim.lsp.completion.enable(true, args.data.client_id, args.buf, {autotrigger = true})
  end,
})
vim.lsp.config('*', {
  root_markers = {'.git'}
})
vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('zls')

vim.cmd.colorscheme('gruvbox')

-- [[ Package Maintenance ]]
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      auto_install = true,
      highlight = { enable = true },
    },
  },
  { 'norcalli/nvim-colorizer.lua' },
  -- { 'S1M0N38/love2d.nvim',
  --   event = 'VeryLazy',
  --   opts = {},
  --   keys = {
  --     { '<leader>v', ft = 'lua', desc = 'LOVE' },
  --     { '<leader>vv', '<cmd>LoveRun<cr>', ft = 'lua', desc = 'Run LOVE' },
  --     { '<leader>vs', '<cmd>LoveStop<cr>', ft = 'lua', desc = 'Stop LOVE' },
  --   }
  -- }
})
