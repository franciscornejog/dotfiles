return {
  'nvim-neotest/neotest',
  dependencies = {
    'rouge8/neotest-rust',
  },
  config = function()
    vim.keymap.set('n', ' ta', function() require('neotest').run.attach() end)
    vim.keymap.set('n', ' tr', function() require('neotest').run.run() end)
    vim.keymap.set('n', ' tf', function() require('neotest').run.run(vim.fn.expand('%')) end)
    vim.keymap.set('n', ' tl', function() require('neotest').run.run_last() end)
    vim.keymap.set('n', ' tx', function() require('neotest').run.stop() end)
    vim.keymap.set('n', ' to', function() require('neotest').output.open({ enter = true }) end)
    vim.keymap.set('n', ' ts', function() require('neotest').summary.toggle() end)
    require('neotest').setup({
      adapters = {
        require('neotest-rust')
      },
      icons = {
        failed = 'X',
        passed = '+',
        running = '*',
        skipped = '.',
        unknown = '?',
      },
    })
  end
}
