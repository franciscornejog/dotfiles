return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'c',
        'c_sharp',
        'cpp',
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
      indent = { enable = true, disable = {'python'} },
      playground = { enable = true },
    })
    -- vim.treesitter.language.register.apexcode = 'java'
  end,
  run = function()
    pcall(require('nvim-treesitter.install').update({ with_sync = true }))
  end
}
