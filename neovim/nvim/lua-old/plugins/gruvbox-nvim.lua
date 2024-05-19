return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local colors = require('gruvbox.palette')
    require('gruvbox').setup({
      contrast = 'soft',
      overrides = {
        SignColumn = { bg = '#000000' },
        GitSignsAdd = { fg = colors.bright_green, bg = '#000000'},
        GitSignsChange = { fg = colors.bright_aqua, bg = '#000000'},
        GitSignsDelete = { fg = colors.bright_red, bg = '#000000'},
      },
      transparent_mode = true,
    })
    vim.cmd.colorscheme('gruvbox')
  end
}
