return { 
    'nvim-telescope/telescope.nvim', 
    requires = {
        { 'nvim-lua/plenary.nvim' }
    },
    config = function()
        local m = require('keymap')
        m.n(' ff', ":lua require('telescope.builtin').find_files()<cr>")
        m.n(' fb', ":lua require('telescope.builtin').file_browser()<cr>")
        m.n(' fg', ":lua require('telescope.builtin').live_grep()<cr>")
        m.n(' fg', ":lua require('telescope.builtin').git_files()<cr>")
        m.n(' vb', ":lua require('telescope.builtin').buffers()<cr>")
        m.n(' vh', ":lua require('telescope.builtin').help_tags()<cr>")
        m.n(' vk', ":lua require('telescope.builtin').keymaps()<cr>")
        m.n(' vl', ":lua require('telescope.builtin').highlights()<cr>")
    end,
}

