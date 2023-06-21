return {
  'tpope/vim-fugitive',
  dependencies = { 'lewis6991/gitsigns.nvim' },
  keys = {
    { ' gS', ':Git<cr>', desc = 'Git: Open' },
    { ' gl', ':Git log<cr>', desc = 'Git: Open Log' },
    { ' gc', ':Git commit<cr>i', desc = 'Git: Commit' },
    { ' gp', ':Git push<cr>', desc = 'Git: Push' },
    { ' gf', ':Git fetch<cr>', desc = 'Git: Fetch' },
  },
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', ' ga', function() require('gitsigns').stage_buffer() end)
    vim.keymap.set('n', ' gh', function() require('gitsigns').stage_hunk() end)
    vim.keymap.set('n', ' grh', function() require('gitsigns').reset_hunk() end)
    vim.keymap.set('n', ' gb', function() require('gitsigns').blame_line({ full = true }) end)
  end
}
