local keymap = {}

keymap.map = function(mode, lhs, rhs)
    local options = { noremap = true }
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

keymap.n = function(lhs, rhs)
    keymap.map('n', lhs, rhs)
end

return keymap
