-- Personal Neovim Configuration
-- Author:  Francisco Cornejo-Garcia (franciscornejog)

-- [[ Global Variables ]]
vim.g.mapleader = " "              -- change global map leader to SPC
vim.g.maplocalleader = " "         -- change local map leader to SPC

-- [[ Options ]] 'option-list'
vim.opt.breakindent = true         -- enable break indent TODO - look into 'briopt', 'sbr'
vim.opt.clipboard = 'unnamedplus'  -- sync clipboard between OS and Neovim
vim.opt.colorcolumn = '100'        -- highlight column line
vim.opt.cursorline = true          -- show which line your cursor is on
vim.opt.ignorecase = true          -- ignore case unless \C
vim.opt.inccommand = 'split'       -- see substitutions in preview window
vim.opt.list = true                -- show whitespace
vim.opt.listchars = { tab = '> ', trail = '·', nbsp = '␣' }
vim.opt.number = true              -- enable line numbers
vim.opt.signcolumn = 'yes:1'       -- enable extra column always to prevent shifting
vim.opt.smartcase = true           -- capital case only
vim.opt.splitbelow = true          -- split below
vim.opt.splitright = true          -- split right
vim.opt.undofile = true            -- save undo history outside editor
vim.opt.updatetime = 250           -- decrease update time

-- [[ Basic Keymaps ]] 'vim.keymap.set()'
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>')
vim.keymap.set('n', ']b', '<cmd>bnext<cr>')
vim.keymap.set('n', '[q', '<cmd>cprevious<cr>')
vim.keymap.set('n', ']q', '<cmd>cnext<cr>')
vim.keymap.set('n', 'gS', ':source %<cr>')

-- [[ Basic Autocommands ]] 'lua-guide-autocommands'
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Package Manager ]]
-- :help lazy.nvim.txt :help lsp-vs-treesitter`
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Plugins ]]
require('lazy').setup({
  { 'kylechui/nvim-surround', event = 'VeryLazy' },
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-refactor',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },
      },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
    event = 'InsertEnter',
    config = function()
      vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-u>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.confirm(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              buffer ='[buf]',
              nvim_lua = '[lua]',
              nvim_lsp = '[lsp]',
              luasnip = '[snip]',
              path = '[path]',
              cmdline = '[cmd]',
            })[entry.source.name]
            return vim_item
          end
        },
      })

      cmp.setup.filetype('lua', {
        sources = cmp.config.sources({
          { name = 'nvim_lua'},
          { name = 'buffer' },
        })
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
        {{ name = 'path' }},
        {{ name = 'cmdline' }}
        )
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
      -- 'simrat39/rust-tools.nvim',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          map('gd', vim.lsp.buf.definition, '[G]o to [D]efinition')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        end
      })
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      local servers = {
        -- apex_ls = {}, -- Salesforce
        -- cssls = {},
        -- gopls = {},
        -- html = {},
        -- omnisharp = {},
        -- rust_analyzer = { require('rust-tools').setup({}) },
        -- tsserver = {},
        -- svelte = {},
        jdtls = {
          settings = {
            java = {
              configuration = {
                runtimes = {
                  {
                    name = 'JavaSE-21',
                    path = require('lspconfig').util.root_pattern('pom.xml', 'build.gradle', '.git') or vim.fn.getcwd(),
                    default = true,
                  },
                },
              },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'hs', 'vim', 'it', 'describe' }
              },
            },
          },
        },
      }
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installed = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'c_sharp',
        'cpp',
        'css',
        'diff',
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
      highlight = { enable = true, },
      indent = { enable = true },
    },
    -- vim.treesitter.language.register.apexcode = 'java'
    -- run = function()
    --   pcall(require('nvim-treesitter.install').update({ with_sync = true }))
    -- end
  },
})
-- vim: ts=2 sts=2 sw=2 et
