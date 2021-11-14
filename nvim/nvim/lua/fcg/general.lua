local set = vim.opt

vim.cmd 'colorscheme noired'               -- Set specified colorscheme 
set.expandtab = true                       -- Turn tab to spaces
set.shiftwidth = 4                         -- Indent with specific white space
set.smartindent = true                     -- Smart auto indenting
set.softtabstop = 4                        -- Set specific white space
set.swapfile = false                       -- No swap files
set.tabstop = 4                            -- Set tab width
set.undofile = true                        -- Enable undo outside editor
set.exrc = true                            -- Source project vim configurations
set.hidden = true                          -- Keep sets in background
set.hlsearch = false                       -- Turn off highlight search when done
set.joinspaces = false                     -- Standardize join command
set.shortmess = 'aoOtTcF'                  -- Abbreviate messages
set.showmode = false                       -- Remove mode indicators
set.updatetime = 50                        -- Lower update time
set.colorcolumn = '80'                     -- Highlight column line
set.cursorcolumn = true                    -- Highlight cursor column
set.cursorline = true                      -- Highlight cursor line
set.signcolumn = 'yes:1'                   -- Show more info beside text
set.wrap = false                           -- Do not wrap

