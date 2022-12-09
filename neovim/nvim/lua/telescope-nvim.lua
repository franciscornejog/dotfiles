return { 'nvim-telescope/telescope.nvim', config = function()
    vim.keymap.set('n', ' ff', function() require('telescope.builtin').find_files() end)
    vim.keymap.set('n', ' ft', function() require('telescope.builtin').live_grep() end)
    vim.keymap.set('n', ' fg', function() require('telescope.builtin').git_files() end)
    vim.keymap.set('n', ' fb', function() require('telescope.builtin').buffers() end)
    vim.keymap.set('n', ' fk', function() require('telescope.builtin').keymaps() end)
    vim.keymap.set('n', ' fh', function() require('telescope.builtin').highlights() end)
end }

