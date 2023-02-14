return { 'wbthomason/packer.nvim', config = function()
    local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true})
    vim.api.nvim_create_autocmd('BufWritePost', {
        command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
        group = packer_group,
        pattern = vim.fn.expand('$MYVIMRC'),
    })
    vim.keymap.set('n', ' rs', ':PackerSync<cr>')
end }

