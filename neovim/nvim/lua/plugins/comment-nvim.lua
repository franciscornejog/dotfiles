return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup({
      toggler = {
        line = 'gcc',
        block = 'gCC',
      },
      opleader = {
        line = 'gc',
        block = 'gC',
      },
    })
  end
}
