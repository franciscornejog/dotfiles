vim.cmd.highlight('clear')
vim.g.colors_name = 'gruvbox'

local colors = {
  bg0_dark = '#000000',
  bg1_dark = '#3c3836',
  bg2_dark = '#504945',
  bg3_dark = '#665c54',
  bg4_dark = '#7c6f64',
  fg0_light = '#f9f5d7',
  fg1_light = '#ebdbb2',
  fg2_light = '#d5c4a1',
  fg3_light = '#bdae93',
  fg4_light = '#a89984',
  red = '#fb4934',
  green = '#b8bb26',
  yellow = '#fabd2f',
  blue = '#83a598',
  purple = '#d3869b',
  aqua = '#8ec07c',
  orange = '#fe8019',
  neutral_red = '#cc241d',
  neutral_green = '#98971a',
  neutral_yellow = '#d79921',
  neutral_blue = '#458588',
  neutral_purple = '#b16286',
  neutral_aqua = '#689d6a',
  neutral_orange = '#d65d0e',
  faded_red = '#9d0006',
  faded_green = '#79740e',
  faded_yellow = '#b57614',
  faded_blue = '#076678',
  faded_purple = '#8f3f71',
  faded_aqua = '#427b58',
  faded_orange = '#af3a03',
  dark_red = '#792329',
  dark_green = '#5a633a',
  dark_aqua = '#3e4934',
  gray = '#928374',
}

local term_colors = {
  colors.bg0_dark,
  colors.neutral_red,
  colors.neutral_green,
  colors.neutral_yellow,
  colors.neutral_blue,
  colors.neutral_purple,
  colors.neutral_aqua,
  colors.fg4_light,
  colors.gray,
  colors.red,
  colors.green,
  colors.yellow,
  colors.blue,
  colors.purple,
  colors.aqua,
  colors.fg1_light,
}
for index, value in ipairs(term_colors) do
  vim.g['terminal_color_' .. index - 1] = value
end

local groups = {
  GruvboxFg1 = { fg = colors.fg1_light },
  GruvboxFg2 = { fg = colors.fg2_light },
  GruvboxFg3 = { fg = colors.fg3_light },
  GruvboxFg4 = { fg = colors.fg4_light },
  GruvboxGray = { fg = colors.gray },
  GruvboxBg0 = { fg = colors.bg0_dark },
  GruvboxBg1 = { fg = colors.bg1_dark },
  GruvboxBg2 = { fg = colors.bg2_dark },
  GruvboxBg3 = { fg = colors.bg2_dark },
  GruvboxBg4 = { fg = colors.bg4_dark },
  GruvboxRed = { fg = colors.red },
  GruvboxRedBold = { fg = colors.red, bold = true },
  GruvboxGreen = { fg = colors.green },
  GruvboxGreenBold = { fg = colors.green, bold = true },
  GruvboxYellow = { fg = colors.yellow },
  GruvboxYellowBold = { fg = colors.yellow, bold = true },
  GruvboxBlue = { fg = colors.blue },
  GruvboxBlueBold = { fg = colors.blue, bold = true },
  GruvboxPurple = { fg = colors.purple },
  GruvboxPurpleBold = { fg = colors.purple, bold = true },
  GruvboxAqua = { fg = colors.aqua },
  GruvboxAquaBold = { fg = colors.aqua, bold = true },
  GruvboxOrange = { fg = colors.orange },
  GruvboxOrangeBold = { fg = colors.orange, bold = true },
  GruvboxRedSign = { fg = colors.red, bg = colors.bg1_dark, reverse = false },
  GruvboxGreenSign = { fg = colors.green, bg = colors.bg1_dark, reverse = false },
  GruvboxYellowSign = { fg = colors.yellow, bg = colors.bg1_dark, reverse = false },
  GruvboxBlueSign = { fg = colors.blue, bg = colors.bg1_dark, reverse = false },
  GruvboxPurpleSign = { fg = colors.purple, bg = colors.bg1_dark, reverse = false },
  GruvboxAquaSign = { fg = colors.aqua, bg = colors.bg1_dark, reverse = false },
  GruvboxOrangeSign = { fg = colors.orange, bg = colors.bg1_dark, reverse = false },
  GruvboxRedUnderline = { underdotted = true, sp = colors.red },
  GruvboxGreenUnderline = { underdotted = true, sp = colors.green },
  GruvboxYellowUnderline = { underdotted = true, sp = colors.yellow },
  GruvboxBlueUnderline = { underdotted = true, sp = colors.blue },
  GruvboxPurpleUnderline = { underdotted = true, sp = colors.purple },
  GruvboxAquaUnderline = { underdotted = true, sp = colors.aqua },
  GruvboxOrangeUnderline = { underdotted = true, sp = colors.orange },
  Normal = { fg = colors.fg1_light },
  NormalFloat = { fg = colors.fg1_light },
  NormalNC = { fg = colors.fg0_light, bg = colors.bg1_dark },
  CursorLine = { bg = colors.bg1_dark },
  CursorColumn = { link = 'CursorLine' },
  TabLineFill = { fg = colors.bg4_dark, bg = colors.bg1_dark, reverse = false },
  TabLineSel = { fg = colors.green, bg = colors.bg1_dark, reverse = false },
  TabLine = { link = 'TabLineFill' },
  MatchParen = { bg = colors.bg3_dark, bold = true },
  ColorColumn = { bg = colors.bg1_dark },
  Conceal = { fg = colors.blue },
  CursorLineNr = { fg = colors.yellow, bg = colors.bg1_dark },
  NonText = { link = 'GruvboxBg2' },
  SpecialKey = { link = 'GruvboxFg4' },
  Visual = { bg = colors.bg3_dark, reverse = false },
  VisualNOS = { link = 'Visual' },
  Search = { fg = colors.yellow, bg = colors.bg0_dark, reverse = true },
  IncSearch = { fg = colors.orange, bg = colors.bg0_dark, reverse = true },
  CurSearch = { link = 'IncSearch' },
  QuickFixLine = { link = 'GruvboxPurple' },
  Underlined = { fg = colors.blue, underline = true },
  StatusLine = { fg = colors.fg1_light, bg = colors.bg2_dark },
  StatusLineNC = { fg = colors.fg4_light, bg = colors.bg1_dark },
  WinBar = { fg = colors.fg4_light, bg = colors.bg0_dark },
  WinBarNC = { fg = colors.fg3_light, bg = colors.bg1_dark },
  WinSeparator = { fg = colors.bg3_dark, bg = colors.bg0_dark },
  WildMenu = { fg = colors.blue, bg = colors.bg2_dark, bold = true },
  Directory = { link = 'GruvboxGreenBold' },
  Title = { link = 'GruvboxGreenBold' },
  ErrorMsg = { fg = colors.bg0_dark, bg = colors.red, bold = true },
  MoreMsg = { link = 'GruvboxYellowBold' },
  ModeMsg = { link = 'GruvboxYellowBold' },
  Question = { link = 'GruvboxOrangeBold' },
  WarningMsg = { link = 'GruvboxRedBold' },
  LineNr = { fg = colors.bg4_dark },
  SignColumn = { bg = colors.bg1_dark },
  Folded = { fg = colors.gray, bg = colors.bg1_dark, italic = true },
  FoldColumn = { fg = colors.gray, bg = colors.bg1_dark },
  Cursor = { reverse = true },
  vCursor = { link = 'Cursor' },
  iCursor = { link = 'Cursor' },
  lCursor = { link = 'Cursor' },
  Special = { link = 'GruvboxOrange' },
  Comment = { fg = colors.gray, italic = true },
  Todo = { fg = colors.bg0_dark, bg = colors.yellow, bold = true, italic = true },
  Done = { fg = colors.orange, bold = true, italic = true },
  Error = { fg = colors.red, bold = true, reverse = true },
  Statement = { link = 'GruvboxRed' },
  Conditional = { link = 'GruvboxRed' },
  Repeat = { link = 'GruvboxRed' },
  Label = { link = 'GruvboxRed' },
  Exception = { link = 'GruvboxRed' },
  Operator = { fg = colors.orange, italic = false },
  Keyword = { link = 'GruvboxRed' },
  Identifier = { link = 'GruvboxBlue' },
  Function = { link = 'GruvboxGreenBold' },
  PreProc = { link = 'GruvboxAqua' },
  Include = { link = 'GruvboxAqua' },
  Define = { link = 'GruvboxAqua' },
  Macro = { link = 'GruvboxAqua' },
  PreCondit = { link = 'GruvboxAqua' },
  Constant = { link = 'GruvboxPurple' },
  Character = { link = 'GruvboxPurple' },
  String = { fg = colors.green, italic = true },
  Boolean = { link = 'GruvboxPurple' },
  Number = { link = 'GruvboxPurple' },
  Float = { link = 'GruvboxPurple' },
  Type = { link = 'GruvboxYellow' },
  StorageClass = { link = 'GruvboxOrange' },
  Structure = { link = 'GruvboxAqua' },
  Typedef = { link = 'GruvboxYellow' },
  Pmenu = { fg = colors.fg1_light, bg = colors.bg2_dark },
  PmenuSel = { fg = colors.bg2_dark, bg = colors.blue, bold = true },
  PmenuSbar = { bg = colors.bg2_dark },
  PmenuThumb = { bg = colors.bg4_dark },
  DiffDelete = { bg = colors.dark_red },
  DiffAdd = { bg = colors.dark_green },
  DiffChange = { bg = colors.dark_aqua },
  DiffText = { bg = colors.yellow, fg = colors.bg0_dark },
  SpellCap = { link = 'GruvboxBlueUnderline' },
  SpellBad = { link = 'GruvboxRedUnderline' },
  SpellLocal = { link = 'GruvboxAquaUnderline' },
  SpellRare = { link = 'GruvboxPurpleUnderline' },
  Whitespace = { fg = colors.bg2_dark },
  Delimiter = { link = 'GruvboxOrange' },
  EndOfBuffer = { link = 'NonText' },
  DiagnosticError = { link = 'GruvboxRed' },
  DiagnosticWarn = { link = 'GruvboxYellow' },
  DiagnosticInfo = { link = 'GruvboxBlue' },
  DiagnosticHint = { link = 'GruvboxAqua' },
  DiagnosticOk = { link = 'GruvboxGreen' },
  DiagnosticSignError = { link = 'GruvboxRedSign' },
  DiagnosticSignWarn = { link = 'GruvboxYellowSign' },
  DiagnosticSignInfo = { link = 'GruvboxBlueSign' },
  DiagnosticSignHint = { link = 'GruvboxAquaSign' },
  DiagnosticSignOk = { link = 'GruvboxGreenSign' },
  DiagnosticUnderlineError = { link = 'GruvboxRedUnderline' },
  DiagnosticUnderlineWarn = { link = 'GruvboxYellowUnderline' },
  DiagnosticUnderlineInfo = { link = 'GruvboxBlueUnderline' },
  DiagnosticUnderlineHint = { link = 'GruvboxAquaUnderline' },
  DiagnosticUnderlineOk = { link = 'GruvboxGreenUnderline' },
  DiagnosticFloatingError = { link = 'GruvboxRed' },
  DiagnosticFloatingWarn = { link = 'GruvboxYellow' },
  DiagnosticFloatingInfo = { link = 'GruvboxBlue' },
  DiagnosticFloatingHint = { link = 'GruvboxAqua' },
  DiagnosticFloatingOk = { link = 'GruvboxGreen' },
  DiagnosticVirtualTextError = { link = 'GruvboxRed' },
  DiagnosticVirtualTextWarn = { link = 'GruvboxYellow' },
  DiagnosticVirtualTextInfo = { link = 'GruvboxBlue' },
  DiagnosticVirtualTextHint = { link = 'GruvboxAqua' },
  DiagnosticVirtualTextOk = { link = 'GruvboxGreen' },
  LspReferenceRead = { link = 'GruvboxYellowBold' },
  LspReferenceTarget = { link = 'Visual' },
  LspReferenceText = { link = 'GruvboxYellowBold' },
  LspReferenceWrite = { link = 'GruvboxOrangeBold' },
  LspCodeLens = { link = 'GruvboxGray' },
  LspSignatureActiveParameter = { link = 'Search' },
  gitcommitSelectedFile = { link = 'GruvboxGreen' },
  gitcommitDiscardedFile = { link = 'GruvboxRed' },
  GitSignsAdd = { link = 'GruvboxGreen' },
  GitSignsChange = { link = 'GruvboxOrange' },
  GitSignsDelete = { link = 'GruvboxRed' },
  debugPC = { link = 'DiffAdd' },
  debugBreakpoint = { link = 'GruvboxRedSign' },
  netrwDir = { link = 'GruvboxAqua' },
  netrwClassify = { link = 'GruvboxAqua' },
  netrwLink = { link = 'GruvboxGray' },
  netrwSymLink = { link = 'GruvboxFg1' },
  netrwExe = { link = 'GruvboxYellow' },
  netrwComment = { link = 'GruvboxGray' },
  netrwList = { link = 'GruvboxBlue' },
  netrwHelpCmd = { link = 'GruvboxAqua' },
  netrwCmdSep = { link = 'GruvboxFg3' },
  netrwVersion = { link = 'GruvboxGreen' },
  diffAdded = { link = 'DiffAdd' },
  diffRemoved = { link = 'DiffDelete' },
  diffChanged = { link = 'DiffChange' },
  diffFile = { link = 'GruvboxOrange' },
  diffNewFile = { link = 'GruvboxYellow' },
  diffOldFile = { link = 'GruvboxOrange' },
  diffLine = { link = 'GruvboxBlue' },
  diffIndexLine = { link = 'diffChanged' },
  LspInlayHint = { link = 'comment' },
  ['@comment'] = { link = 'Comment' },
  ['@none'] = { bg = 'NONE', fg = 'NONE' },
  ['@preproc'] = { link = 'PreProc' },
  ['@define'] = { link = 'Define' },
  ['@operator'] = { link = 'Operator' },
  ['@punctuation.delimiter'] = { link = 'Delimiter' },
  ['@punctuation.bracket'] = { link = 'Delimiter' },
  ['@punctuation.special'] = { link = 'Delimiter' },
  ['@string'] = { link = 'String' },
  ['@string.regex'] = { link = 'String' },
  ['@string.regexp'] = { link = 'String' },
  ['@string.escape'] = { link = 'SpecialChar' },
  ['@string.special'] = { link = 'SpecialChar' },
  ['@string.special.path'] = { link = 'Underlined' },
  ['@string.special.symbol'] = { link = 'Identifier' },
  ['@string.special.url'] = { link = 'Underlined' },
  ['@character'] = { link = 'Character' },
  ['@character.special'] = { link = 'SpecialChar' },
  ['@boolean'] = { link = 'Boolean' },
  ['@number'] = { link = 'Number' },
  ['@number.float'] = { link = 'Float' },
  ['@float'] = { link = 'Float' },
  ['@function'] = { link = 'Function' },
  ['@function.builtin'] = { link = 'Special' },
  ['@function.call'] = { link = 'Function' },
  ['@function.macro'] = { link = 'Macro' },
  ['@function.method'] = { link = 'Function' },
  ['@method'] = { link = 'Function' },
  ['@method.call'] = { link = 'Function' },
  ['@constructor'] = { link = 'Special' },
  ['@parameter'] = { link = 'Identifier' },
  ['@keyword'] = { link = 'Keyword' },
  ['@keyword.conditional'] = { link = 'Conditional' },
  ['@keyword.debug'] = { link = 'Debug' },
  ['@keyword.directive'] = { link = 'PreProc' },
  ['@keyword.directive.define'] = { link = 'Define' },
  ['@keyword.exception'] = { link = 'Exception' },
  ['@keyword.function'] = { link = 'Keyword' },
  ['@keyword.import'] = { link = 'Include' },
  ['@keyword.operator'] = { link = 'GruvboxRed' },
  ['@keyword.repeat'] = { link = 'Repeat' },
  ['@keyword.return'] = { link = 'Keyword' },
  ['@keyword.storage'] = { link = 'StorageClass' },
  ['@conditional'] = { link = 'Conditional' },
  ['@repeat'] = { link = 'Repeat' },
  ['@debug'] = { link = 'Debug' },
  ['@label'] = { link = 'Label' },
  ['@include'] = { link = 'Include' },
  ['@exception'] = { link = 'Exception' },
  ['@type'] = { link = 'Type' },
  ['@type.builtin'] = { link = 'Type' },
  ['@type.definition'] = { link = 'Typedef' },
  ['@type.qualifier'] = { link = 'Type' },
  ['@storageclass'] = { link = 'StorageClass' },
  ['@attribute'] = { link = 'PreProc' },
  ['@field'] = { link = 'Identifier' },
  ['@property'] = { link = 'Identifier' },
  ['@variable'] = { link = 'GruvboxFg1' },
  ['@variable.builtin'] = { link = 'Special' },
  ['@variable.member'] = { link = 'Identifier' },
  ['@variable.parameter'] = { link = 'Identifier' },
  ['@constant'] = { link = 'Constant' },
  ['@constant.builtin'] = { link = 'Special' },
  ['@constant.macro'] = { link = 'Define' },
  ['@markup'] = { link = 'GruvboxFg1' },
  ['@markup.strong'] = { bold = true },
  ['@markup.italic'] = { link = '@text.emphasis' },
  ['@markup.underline'] = { underline = true },
  ['@markup.strikethrough'] = { strikethrough = true },
  ['@markup.heading'] = { link = 'Title' },
  ['@markup.raw'] = { link = 'String' },
  ['@markup.math'] = { link = 'Special' },
  ['@markup.environment'] = { link = 'Macro' },
  ['@markup.environment.name'] = { link = 'Type' },
  ['@markup.link'] = { link = 'Underlined' },
  ['@markup.link.label'] = { link = 'SpecialChar' },
  ['@markup.list'] = { link = 'Delimiter' },
  ['@markup.list.checked'] = { link = 'GruvboxGreen' },
  ['@markup.list.unchecked'] = { link = 'GruvboxGray' },
  ['@comment.todo'] = { link = 'Todo' },
  ['@comment.note'] = { link = 'SpecialComment' },
  ['@comment.warning'] = { link = 'WarningMsg' },
  ['@comment.error'] = { link = 'ErrorMsg' },
  ['@diff.plus'] = { link = 'diffAdded' },
  ['@diff.minus'] = { link = 'diffRemoved' },
  ['@diff.delta'] = { link = 'diffChanged' },
  ['@module'] = { link = 'GruvboxFg1' },
  ['@namespace'] = { link = 'GruvboxFg1' },
  ['@symbol'] = { link = 'Identifier' },
  ['@text'] = { link = 'GruvboxFg1' },
  ['@text.strong'] = { bold = true },
  ['@text.emphasis'] = { italic = true },
  ['@text.underline'] = { underline = true },
  ['@text.strike'] = { strikethrough = true },
  ['@text.title'] = { link = 'Title' },
  ['@text.literal'] = { link = 'String' },
  ['@text.uri'] = { link = 'Underlined' },
  ['@text.math'] = { link = 'Special' },
  ['@text.environment'] = { link = 'Macro' },
  ['@text.environment.name'] = { link = 'Type' },
  ['@text.reference'] = { link = 'Constant' },
  ['@text.todo'] = { link = 'Todo' },
  ['@text.todo.checked'] = { link = 'GruvboxGreen' },
  ['@text.todo.unchecked'] = { link = 'GruvboxGray' },
  ['@text.note'] = { link = 'SpecialComment' },
  ['@text.note.comment'] = { fg = colors.purple, bold = true },
  ['@text.warning'] = { link = 'WarningMsg' },
  ['@text.danger'] = { link = 'ErrorMsg' },
  ['@text.danger.comment'] = { fg = colors.fg0_light, bg = colors.red, bold = true },
  ['@text.diff.add'] = { link = 'diffAdded' },
  ['@text.diff.delete'] = { link = 'diffRemoved' },
  ['@tag'] = { link = 'Tag' },
  ['@tag.attribute'] = { link = 'Identifier' },
  ['@tag.delimiter'] = { link = 'Delimiter' },
  ['@punctuation'] = { link = 'Delimiter' },
  ['@macro'] = { link = 'Macro' },
  ['@structure'] = { link = 'Structure' },
  ['@lsp.type.class'] = { link = '@type' },
  ['@lsp.type.comment'] = { link = '@comment' },
  ['@lsp.type.decorator'] = { link = '@macro' },
  ['@lsp.type.enum'] = { link = '@type' },
  ['@lsp.type.enumMember'] = { link = '@constant' },
  ['@lsp.type.function'] = { link = '@function' },
  ['@lsp.type.interface'] = { link = '@constructor' },
  ['@lsp.type.macro'] = { link = '@macro' },
  ['@lsp.type.method'] = { link = '@method' },
  ['@lsp.type.modifier.java'] = { link = '@keyword.type.java' },
  ['@lsp.type.namespace'] = { link = '@namespace' },
  ['@lsp.type.parameter'] = { link = '@parameter' },
  ['@lsp.type.property'] = { link = '@property' },
  ['@lsp.type.struct'] = { link = '@type' },
  ['@lsp.type.type'] = { link = '@type' },
  ['@lsp.type.typeParameter'] = { link = '@type.definition' },
  ['@lsp.type.variable'] = { link = '@variable' },
}

for group, settings in pairs(groups) do
  vim.api.nvim_set_hl(0, group, settings)
end
