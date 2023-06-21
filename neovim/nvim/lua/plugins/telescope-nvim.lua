return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { ' ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
    { ' ft', '<cmd>Telescope live_grep<cr>', desc = 'Find text' },
    { ' fg', '<cmd>Telescope git_files<cr>', desc = 'Find git' },
    { ' fb', '<cmd>Telescope buffers<cr>', desc = 'Find buffers' },
    { ' fk', '<cmd>Telescope keymaps<cr>', desc = 'Find keymaps' },
    { ' fh', '<cmd>Telescope highlights<cr>', desc = 'Find help' },
  },
}
