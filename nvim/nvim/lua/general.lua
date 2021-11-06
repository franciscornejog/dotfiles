local global = vim.o
local window = vim.wo
local buffer = vim.bo

vim.cmd 'colorscheme noired'                  -- Set specified colorscheme 
buffer.expandtab = true                       -- Turn tab to spaces
buffer.shiftwidth = 4                         -- Indent with specific white space
buffer.smartindent = true                     -- Smart auto indenting
buffer.softtabstop = 4                        -- Set specific white space
buffer.swapfile = false                       -- No swap files
buffer.tabstop = 4                            -- Set tab width
buffer.undofile = true                        -- Enable undo outside editor
global.backup = false                         -- No backup
global.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete without selecting
global.exrc = true                            -- Source project vim configurations
global.hidden = true                          -- Keep buffers in background
global.hlsearch = false                       -- Turn off highlight search when done
global.joinspaces = false                     -- Standardize join command
global.shortmess = 'aoOtTcF'                  -- Abbreviate messages
global.showmode = false                       -- Remove mode indicators
global.termguicolors = true                   -- Wider range of colors
global.updatetime = 50                        -- Lower update time?
window.colorcolumn = '80'                       -- Highlight column line
window.cursorcolumn = true                    -- Highlight cursor column
window.cursorline = true                      -- Highlight cursor line
window.signcolumn = 'yes'                     -- Show more info beside text
window.spell = true                           -- Spellcheck
window.wrap = false                           -- Do not wrap

