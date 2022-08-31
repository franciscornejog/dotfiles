return { 'nvim-telescope/telescope.nvim', config = function()
    vim.keymap.set('n', ' ff', ":lua require('telescope.builtin').find_files()<cr>")
    vim.keymap.set('n', ' ft', ":lua require('telescope.builtin').live_grep()<cr>")
    vim.keymap.set('n', ' fg', ":lua require('telescope.builtin').git_files()<cr>")
    vim.keymap.set('n', ' fb', ":lua require('telescope.builtin').buffers()<cr>")
    vim.keymap.set('n', ' fk', ":lua require('telescope.builtin').keymaps()<cr>")
    vim.keymap.set('n', ' fh', ":lua require('telescope.builtin').highlights()<cr>")
end }

