local M = {}

-- neovim terminal mode colors
local function set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.bg0
  vim.g.terminal_color_8 = colors.gray
  vim.g.terminal_color_1 = colors.neutral_red
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_2 = colors.neutral_green
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_3 = colors.neutral_yellow
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_4 = colors.neutral_blue
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_5 = colors.neutral_purple
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_6 = colors.neutral_aqua
  vim.g.terminal_color_14 = colors.aqua
  vim.g.terminal_color_7 = colors.fg4
  vim.g.terminal_color_15 = colors.fg1
end

M.setup = function()
  local config = require("rosePine").config
  local colors = require("rosePine.palette").get_base_colors(vim.o.background, config.contrast)

  set_terminal_colors(colors)

  local groups = {
    -- Base groups
    RosePineFg0 = { fg = colors.fg0 },
    RosePineFg1 = { fg = colors.fg1 },
    RosePineFg2 = { fg = colors.fg2 },
    RosePineFg3 = { fg = colors.fg3 },
    RosePineFg4 = { fg = colors.fg4 },
    RosePineGray = { fg = colors.gray },
    RosePineBg0 = { fg = colors.bg0 },
    RosePineBg1 = { fg = colors.bg1 },
    RosePineBg2 = { fg = colors.bg2 },
    RosePineBg3 = { fg = colors.bg3 },
    RosePineBg4 = { fg = colors.bg4 },
    RosePineRed = { fg = colors.red },
    RosePineRedBold = { fg = colors.red, bold = config.bold },
    RosePineGreen = { fg = colors.green },
    RosePineGreenBold = { fg = colors.green, bold = config.bold },
    RosePineYellow = { fg = colors.yellow },
    RosePineYellowBold = { fg = colors.yellow, bold = config.bold },
    RosePineBlue = { fg = colors.blue },
    RosePineBlueBold = { fg = colors.blue, bold = config.bold },
    RosePinePurple = { fg = colors.purple },
    RosePinePurpleBold = { fg = colors.purple, bold = config.bold },
    RosePineAqua = { fg = colors.aqua },
    RosePineAquaBold = { fg = colors.aqua, bold = config.bold },
    RosePineOrange = { fg = colors.orange },
    RosePineOrangeBold = { fg = colors.orange, bold = config.bold },
    RosePineRedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
      or { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    RosePineGreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
      or { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    RosePineYellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
      or { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    RosePineBlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
      or { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    RosePinePurpleSign = config.transparent_mode and { fg = colors.purple, reverse = config.invert_signs }
      or { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    RosePineAquaSign = config.transparent_mode and { fg = colors.aqua, reverse = config.invert_signs }
      or { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    RosePineOrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
      or { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    RosePineRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    RosePineGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    RosePineYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    RosePineBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    RosePinePurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    RosePineAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    RosePineOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
    Normal = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg0 },
    NormalFloat = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg1 },
    NormalNC = config.dim_inactive and { fg = colors.fg0, bg = colors.bg1 } or { link = "Normal" },
    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },
    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.green, bg = colors.bg1, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },
    MatchParen = { bg = colors.bg3, bold = config.bold },
    ColorColumn = { bg = colors.bg1 },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },
    NonText = { link = "RosePineBg2" },
    SpecialKey = { link = "RosePineFg4" },
    Visual = { bg = colors.bg3, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    IncSearch = { fg = colors.orange, bg = colors.bg0, reverse = config.inverse },
    CurSearch = { link = "IncSearch" },
    QuickFixLine = { fg = colors.bg0, bg = colors.yellow, bold = config.bold },
    Underlined = { fg = colors.blue, underline = config.underline },
    StatusLine = { fg = colors.bg2, bg = colors.fg1, reverse = config.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg4, reverse = config.inverse },
    WinBar = { fg = colors.fg4, bg = colors.bg0 },
    WinBarNC = { fg = colors.fg3, bg = colors.bg1 },
    WinSeparator = config.transparent_mode and { fg = colors.bg3, bg = nil } or { fg = colors.bg3, bg = colors.bg0 },
    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = config.bold },
    Directory = { link = "RosePineBlueBold" },
    Title = { link = "RosePineGreenBold" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "RosePineYellowBold" },
    ModeMsg = { link = "RosePineYellowBold" },
    Question = { link = "RosePineOrangeBold" },
    WarningMsg = { link = "RosePineRedBold" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.gray, bg = nil } or { fg = colors.gray, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "RosePineOrange" },
    Comment = { fg = colors.gray, italic = config.italic.comments },
    -- Todo         anything that needs extra attention; mostly the
    --              keywords TODO FIXME and XXX
    Todo = { fg = colors.bg0, bg = colors.yellow, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "RosePineRed" },
    Conditional = { link = "RosePineRed" },
    Repeat = { link = "RosePineRed" },
    Label = { link = "RosePineRed" },
    Exception = { link = "RosePineRed" },
    Operator = { fg = colors.orange, italic = config.italic.operators },
    Keyword = { link = "RosePineRed" },
    Identifier = { link = "RosePineBlue" },
    Function = { link = "RosePineGreenBold" },
    PreProc = { link = "RosePineAqua" },
    Include = { link = "RosePineAqua" },
    Define = { link = "RosePineAqua" },
    Macro = { link = "RosePineAqua" },
    PreCondit = { link = "RosePineAqua" },
    Constant = { link = "RosePinePurple" },
    Character = { link = "RosePinePurple" },
    String = { fg = colors.green, italic = config.italic.strings },
    Boolean = { link = "RosePinePurple" },
    Number = { link = "RosePinePurple" },
    Float = { link = "RosePinePurple" },
    Type = { link = "RosePineYellow" },
    StorageClass = { link = "RosePineOrange" },
    Structure = { link = "RosePineAqua" },
    Typedef = { link = "RosePineYellow" },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    SpellCap = { link = "RosePineBlueUnderline" },
    SpellBad = { link = "RosePineRedUnderline" },
    SpellLocal = { link = "RosePineAquaUnderline" },
    SpellRare = { link = "RosePinePurpleUnderline" },
    Whitespace = { fg = colors.bg2 },
    -- LSP Diagnostic
    DiagnosticError = { link = "RosePineRed" },
    DiagnosticSignError = { link = "RosePineRedSign" },
    DiagnosticUnderlineError = { link = "RosePineRedUnderline" },
    DiagnosticWarn = { link = "RosePineYellow" },
    DiagnosticSignWarn = { link = "RosePineYellowSign" },
    DiagnosticUnderlineWarn = { link = "RosePineYellowUnderline" },
    DiagnosticInfo = { link = "RosePineBlue" },
    DiagnosticSignInfo = { link = "RosePineBlueSign" },
    DiagnosticUnderlineInfo = { link = "RosePineBlueUnderline" },
    DiagnosticHint = { link = "RosePineAqua" },
    DiagnosticSignHint = { link = "RosePineAquaSign" },
    DiagnosticUnderlineHint = { link = "RosePineAquaUnderline" },
    DiagnosticFloatingError = { link = "RosePineRed" },
    DiagnosticFloatingWarn = { link = "RosePineOrange" },
    DiagnosticFloatingInfo = { link = "RosePineBlue" },
    DiagnosticFloatingHint = { link = "RosePineAqua" },
    DiagnosticVirtualTextError = { link = "RosePineRed" },
    DiagnosticVirtualTextWarn = { link = "RosePineYellow" },
    DiagnosticVirtualTextInfo = { link = "RosePineBlue" },
    DiagnosticVirtualTextHint = { link = "RosePineAqua" },
    LspReferenceRead = { link = "RosePineYellowBold" },
    LspReferenceText = { link = "RosePineYellowBold" },
    LspReferenceWrite = { link = "RosePineOrangeBold" },
    LspCodeLens = { link = "RosePineGray" },
    LspSignatureActiveParameter = { link = "Search" },

    -- nvim-treesitter
    -- See `nvim-treesitter/CONTRIBUTING.md`

    --
    -- Misc
    --
    -- @comment               ; line and block comments
    ["@comment"] = { link = "Comment" },
    -- @comment.documentation ; comments documenting code
    -- @none                  ; completely disable the highlight
    ["@none"] = { bg = "NONE", fg = "NONE" },
    -- @preproc               ; various preprocessor directives & shebangs
    ["@preproc"] = { link = "PreProc" },
    -- @define                ; preprocessor definition directives
    ["@define"] = { link = "Define" },
    -- @operator              ; symbolic operators (e.g. `+` / `*`)
    ["@operator"] = { link = "Operator" },

    --
    -- Punctuation
    --
    -- @punctuation.delimiter ; delimiters (e.g. `;` / `.` / `,`)
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    -- @punctuation.bracket   ; brackets (e.g. `()` / `{}` / `[]`)
    ["@punctuation.bracket"] = { link = "Delimiter" },
    -- @punctuation.special   ; special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special"] = { link = "Delimiter" },

    --
    -- Literals
    --
    -- @string               ; string literals
    ["@string"] = { link = "String" },
    -- @string.documentation ; string documenting code (e.g. Python docstrings)
    -- @string.regex         ; regular expressions
    ["@string.regex"] = { link = "String" },
    -- @string.escape        ; escape sequences
    ["@string.escape"] = { link = "SpecialChar" },
    -- @string.special       ; other special strings (e.g. dates)
    ["@string.special"] = { link = "SpecialChar" },

    -- @character            ; character literals
    ["@character"] = { link = "Character" },
    -- @character.special    ; special characters (e.g. wildcards)
    ["@character.special"] = { link = "SpecialChar" },

    -- @boolean              ; boolean literals
    ["@boolean"] = { link = "Boolean" },
    -- @number               ; numeric literals
    ["@number"] = { link = "Number" },
    -- @float                ; floating-point number literals
    ["@float"] = { link = "Float" },

    --
    -- Functions
    --
    -- @function         ; function definitions
    ["@function"] = { link = "Function" },
    -- @function.builtin ; built-in functions
    ["@function.builtin"] = { link = "Special" },
    -- @function.call    ; function calls
    ["@function.call"] = { link = "Function" },
    -- @function.macro   ; preprocessor macros
    ["@function.macro"] = { link = "Macro" },

    -- @method           ; method definitions
    ["@method"] = { link = "Function" },
    -- @method.call      ; method calls
    ["@method.call"] = { link = "Function" },

    -- @constructor      ; constructor calls and definitions
    ["@constructor"] = { link = "Special" },
    -- @parameter        ; parameters of a function
    ["@parameter"] = { link = "Identifier" },

    --
    -- Keywords
    --
    -- @keyword             ; various keywords
    ["@keyword"] = { link = "Keyword" },
    -- @keyword.coroutine   ; keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    -- @keyword.function    ; keywords that define a function (e.g. `func` in Go, `def` in Python)
    ["@keyword.function"] = { link = "Keyword" },
    -- @keyword.operator    ; operators that are English words (e.g. `and` / `or`)
    ["@keyword.operator"] = { link = "RosePineRed" },
    -- @keyword.return      ; keywords like `return` and `yield`
    ["@keyword.return"] = { link = "Keyword" },

    -- @conditional         ; keywords related to conditionals (e.g. `if` / `else`)
    ["@conditional"] = { link = "Conditional" },
    -- @conditional.ternary ; ternary operator (e.g. `?` / `:`)

    -- @repeat              ; keywords related to loops (e.g. `for` / `while`)
    ["@repeat"] = { link = "Repeat" },
    -- @debug               ; keywords related to debugging
    ["@debug"] = { link = "Debug" },
    -- @label               ; GOTO and other labels (e.g. `label:` in C)
    ["@label"] = { link = "Label" },
    -- @include             ; keywords for including modules (e.g. `import` / `from` in Python)
    ["@include"] = { link = "Include" },
    -- @exception           ; keywords related to exceptions (e.g. `throw` / `catch`)
    ["@exception"] = { link = "Exception" },

    --
    -- Types
    --
    -- @type            ; type or class definitions and annotations
    ["@type"] = { link = "Type" },
    -- @type.builtin    ; built-in types
    ["@type.builtin"] = { link = "Type" },
    -- @type.definition ; type definitions (e.g. `typedef` in C)
    ["@type.definition"] = { link = "Typedef" },
    -- @type.qualifier  ; type qualifiers (e.g. `const`)
    ["@type.qualifier"] = { link = "Type" },

    -- @storageclass    ; modifiers that affect storage in memory or life-time
    ["@storageclass"] = { link = "StorageClass" },
    -- @attribute       ; attribute annotations (e.g. Python decorators)
    ["@attribute"] = { link = "PreProc" },
    -- @field           ; object and struct fields
    ["@field"] = { link = "Identifier" },
    -- @property        ; similar to `@field`
    ["@property"] = { link = "Identifier" },

    --
    -- Identifiers
    --
    -- @variable         ; various variable names
    ["@variable"] = { link = "RosePineFg1" },
    -- @variable.builtin ; built-in variable names (e.g. `this`)
    ["@variable.builtin"] = { link = "Special" },

    -- @constant         ; constant identifiers
    ["@constant"] = { link = "Constant" },
    -- @constant.builtin ; built-in constant values
    ["@constant.builtin"] = { link = "Special" },
    -- @constant.macro   ; constants defined by the preprocessor
    ["@constant.macro"] = { link = "Define" },

    -- @namespace        ; modules or namespaces
    ["@namespace"] = { link = "RosePineFg1" },
    -- @symbol           ; symbols or atoms
    ["@symbol"] = { link = "Identifier" },

    --
    -- Text
    --
    -- @text                  ; non-structured text
    ["@text"] = { link = "RosePineFg1" },
    -- @text.strong           ; bold text
    ["@text.strong"] = { bold = config.bold },
    -- @text.emphasis         ; text with emphasis
    ["@text.emphasis"] = { italic = config.italic.strings },
    -- @text.underline        ; underlined text
    ["@text.underline"] = { underline = config.underline },
    -- @text.strike           ; strikethrough text
    ["@text.strike"] = { strikethrough = config.strikethrough },
    -- @text.title            ; text that is part of a title
    ["@text.title"] = { link = "Title" },
    -- @text.literal          ; literal or verbatim text (e.g., inline code)
    ["@text.literal"] = { link = "String" },
    -- @text.quote            ; text quotations
    -- @text.uri              ; URIs (e.g. hyperlinks)
    ["@text.uri"] = { link = "Underlined" },
    -- @text.math             ; math environments (e.g. `$ ... $` in LaTeX)
    ["@text.math"] = { link = "Special" },
    -- @text.environment      ; text environments of markup languages
    ["@text.environment"] = { link = "Macro" },
    -- @text.environment.name ; text indicating the type of an environment
    ["@text.environment.name"] = { link = "Type" },
    -- @text.reference        ; text references, footnotes, citations, etc.
    ["@text.reference"] = { link = "Constant" },

    -- @text.todo             ; todo notes
    ["@text.todo"] = { link = "Todo" },
    -- @text.note             ; info notes
    ["@text.note"] = { link = "SpecialComment" },
    -- @text.note.comment     ; XXX in comments
    ["@text.note.comment"] = { fg = colors.purple, bold = config.bold },
    -- @text.warning          ; warning notes
    ["@text.warning"] = { link = "WarningMsg" },
    -- @text.danger           ; danger/error notes
    ["@text.danger"] = { link = "ErrorMsg" },
    -- @text.danger.comment   ; FIXME in comments
    ["@text.danger.comment"] = { fg = colors.fg0, bg = colors.red, bold = config.bold },

    -- @text.diff.add         ; added text (for diff files)
    ["@text.diff.add"] = { link = "diffAdded" },
    -- @text.diff.delete      ; deleted text (for diff files)
    ["@text.diff.delete"] = { link = "diffRemoved" },

    --
    -- Tags
    --
    -- @tag           ; XML tag names
    ["@tag"] = { link = "Tag" },
    -- @tag.attribute ; XML tag attributes
    ["@tag.attribute"] = { link = "Identifier" },
    -- @tag.delimiter ; XML tag delimiters
    ["@tag.delimiter"] = { link = "Delimiter" },

    --
    -- Conceal
    --
    -- @conceal ; for captures that are only used for concealing

    --
    -- Spell
    --
    -- @spell   ; for defining regions to be spellchecked
    -- @nospell ; for defining regions that should NOT be spellchecked

    -- Treesitter
    -- See `:help treesitter`
    -- Those are not part of the nvim-treesitter
    ["@punctuation"] = { link = "Delimiter" },
    ["@macro"] = { link = "Macro" },
    ["@structure"] = { link = "Structure" },

    -- Semantic token
    -- See `:help lsp-semantic-highlight`
    ["@lsp.type.class"] = { link = "@constructor" },
    ["@lsp.type.comment"] = {}, -- do not overwrite comments
    ["@lsp.type.decorator"] = { link = "@parameter" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@keyword" },
    ["@lsp.type.macro"] = { link = "@macro" },
    ["@lsp.type.method"] = { link = "@method" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.struct"] = { link = "@constructor" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"] = { link = "@variable" },

    -- gitcommit
    gitcommitSelectedFile = { link = "RosePineGreen" },
    gitcommitDiscardedFile = { link = "RosePineRed" },
    -- gitsigns.nvim
    GitSignsAdd = { link = "RosePineGreenSign" },
    GitSignsChange = { link = "RosePineAquaSign" },
    GitSignsDelete = { link = "RosePineRedSign" },
    -- nvim-tree
    NvimTreeSymlink = { fg = colors.neutral_aqua },
    NvimTreeRootFolder = { fg = colors.neutral_purple, bold = true },
    NvimTreeFolderIcon = { fg = colors.neutral_blue, bold = true },
    NvimTreeFileIcon = { fg = colors.light2 },
    NvimTreeExecFile = { fg = colors.neutral_green, bold = true },
    NvimTreeOpenedFile = { fg = colors.bright_red, bold = true },
    NvimTreeSpecialFile = { fg = colors.neutral_yellow, bold = true, underline = true },
    NvimTreeImageFile = { fg = colors.neutral_purple },
    NvimTreeIndentMarker = { fg = colors.dark3 },
    NvimTreeGitDirty = { fg = colors.neutral_yellow },
    NvimTreeGitStaged = { fg = colors.neutral_yellow },
    NvimTreeGitMerge = { fg = colors.neutral_purple },
    NvimTreeGitRenamed = { fg = colors.neutral_purple },
    NvimTreeGitNew = { fg = colors.neutral_yellow },
    NvimTreeGitDeleted = { fg = colors.neutral_red },
    NvimTreeWindowPicker = { bg = colors.faded_aqua },
    -- termdebug
    debugPC = { bg = colors.faded_blue },
    debugBreakpoint = { link = "RosePineRedSign" },
    -- vim-startify
    StartifyBracket = { link = "RosePineFg3" },
    StartifyFile = { link = "RosePineFg1" },
    StartifyNumber = { link = "RosePineBlue" },
    StartifyPath = { link = "RosePineGray" },
    StartifySlash = { link = "RosePineGray" },
    StartifySection = { link = "RosePineYellow" },
    StartifySpecial = { link = "RosePineBg2" },
    StartifyHeader = { link = "RosePineOrange" },
    StartifyFooter = { link = "RosePineBg2" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    -- vim-dirvish
    DirvishPathTail = { link = "RosePineAqua" },
    DirvishArg = { link = "RosePineYellow" },
    -- netrw
    netrwDir = { link = "RosePineAqua" },
    netrwClassify = { link = "RosePineAqua" },
    netrwLink = { link = "RosePineGray" },
    netrwSymLink = { link = "RosePineFg1" },
    netrwExe = { link = "RosePineYellow" },
    netrwComment = { link = "RosePineGray" },
    netrwList = { link = "RosePineBlue" },
    netrwHelpCmd = { link = "RosePineAqua" },
    netrwCmdSep = { link = "RosePineFg3" },
    netrwVersion = { link = "RosePineGreen" },
    -- nerdtree
    NERDTreeDir = { link = "RosePineAqua" },
    NERDTreeDirSlash = { link = "RosePineAqua" },
    NERDTreeOpenable = { link = "RosePineOrange" },
    NERDTreeClosable = { link = "RosePineOrange" },
    NERDTreeFile = { link = "RosePineFg1" },
    NERDTreeExecFile = { link = "RosePineYellow" },
    NERDTreeUp = { link = "RosePineGray" },
    NERDTreeCWD = { link = "RosePineGreen" },
    NERDTreeHelp = { link = "RosePineFg1" },
    NERDTreeToggleOn = { link = "RosePineGreen" },
    NERDTreeToggleOff = { link = "RosePineRed" },
    -- coc.nvim
    CocErrorSign = { link = "RosePineRedSign" },
    CocWarningSign = { link = "RosePineOrangeSign" },
    CocInfoSign = { link = "RosePineBlueSign" },
    CocHintSign = { link = "RosePineAquaSign" },
    CocErrorFloat = { link = "RosePineRed" },
    CocWarningFloat = { link = "RosePineOrange" },
    CocInfoFloat = { link = "RosePineBlue" },
    CocHintFloat = { link = "RosePineAqua" },
    CocDiagnosticsError = { link = "RosePineRed" },
    CocDiagnosticsWarning = { link = "RosePineOrange" },
    CocDiagnosticsInfo = { link = "RosePineBlue" },
    CocDiagnosticsHint = { link = "RosePineAqua" },
    CocSelectedText = { link = "RosePineRed" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "RosePineGray" },
    CocErrorHighlight = { link = "RosePineRedUnderline" },
    CocWarningHighlight = { link = "RosePineOrangeUnderline" },
    CocInfoHighlight = { link = "RosePineBlueUnderline" },
    CocHintHighlight = { link = "RosePineAquaUnderline" },
    -- telescope.nvim
    TelescopeNormal = { link = "RosePineFg1" },
    TelescopeSelection = { link = "RosePineOrangeBold" },
    TelescopeSelectionCaret = { link = "RosePineRed" },
    TelescopeMultiSelection = { link = "RosePineGray" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "RosePineBlue" },
    TelescopePromptPrefix = { link = "RosePineRed" },
    TelescopePrompt = { link = "TelescopeNormal" },
    -- nvim-cmp
    CmpItemAbbr = { link = "RosePineFg0" },
    CmpItemAbbrDeprecated = { link = "RosePineFg1" },
    CmpItemAbbrMatch = { link = "RosePineBlueBold" },
    CmpItemAbbrMatchFuzzy = { link = "RosePineBlueUnderline" },
    CmpItemMenu = { link = "RosePineGray" },
    CmpItemKindText = { link = "RosePineOrange" },
    CmpItemKindVariable = { link = "RosePineOrange" },
    CmpItemKindMethod = { link = "RosePineBlue" },
    CmpItemKindFunction = { link = "RosePineBlue" },
    CmpItemKindConstructor = { link = "RosePineYellow" },
    CmpItemKindUnit = { link = "RosePineBlue" },
    CmpItemKindField = { link = "RosePineBlue" },
    CmpItemKindClass = { link = "RosePineYellow" },
    CmpItemKindInterface = { link = "RosePineYellow" },
    CmpItemKindModule = { link = "RosePineBlue" },
    CmpItemKindProperty = { link = "RosePineBlue" },
    CmpItemKindValue = { link = "RosePineOrange" },
    CmpItemKindEnum = { link = "RosePineYellow" },
    CmpItemKindOperator = { link = "RosePineYellow" },
    CmpItemKindKeyword = { link = "RosePinePurple" },
    CmpItemKindEvent = { link = "RosePinePurple" },
    CmpItemKindReference = { link = "RosePinePurple" },
    CmpItemKindColor = { link = "RosePinePurple" },
    CmpItemKindSnippet = { link = "RosePineGreen" },
    CmpItemKindFile = { link = "RosePineBlue" },
    CmpItemKindFolder = { link = "RosePineBlue" },
    CmpItemKindEnumMember = { link = "RosePineAqua" },
    CmpItemKindConstant = { link = "RosePineOrange" },
    CmpItemKindStruct = { link = "RosePineYellow" },
    CmpItemKindTypeParameter = { link = "RosePineYellow" },
    diffAdded = { link = "RosePineGreen" },
    diffRemoved = { link = "RosePineRed" },
    diffChanged = { link = "RosePineAqua" },
    diffFile = { link = "RosePineOrange" },
    diffNewFile = { link = "RosePineYellow" },
    diffOldFile = { link = "RosePineOrange" },
    diffLine = { link = "RosePineBlue" },
    diffIndexLine = { link = "diffChanged" },
    -- navic (highlight icons)
    NavicIconsFile = { link = "RosePineBlue" },
    NavicIconsModule = { link = "RosePineOrange" },
    NavicIconsNamespace = { link = "RosePineBlue" },
    NavicIconsPackage = { link = "RosePineAqua" },
    NavicIconsClass = { link = "RosePineYellow" },
    NavicIconsMethod = { link = "RosePineBlue" },
    NavicIconsProperty = { link = "RosePineAqua" },
    NavicIconsField = { link = "RosePinePurple" },
    NavicIconsConstructor = { link = "RosePineBlue" },
    NavicIconsEnum = { link = "RosePinePurple" },
    NavicIconsInterface = { link = "RosePineGreen" },
    NavicIconsFunction = { link = "RosePineBlue" },
    NavicIconsVariable = { link = "RosePinePurple" },
    NavicIconsConstant = { link = "RosePineOrange" },
    NavicIconsString = { link = "RosePineGreen" },
    NavicIconsNumber = { link = "RosePineOrange" },
    NavicIconsBoolean = { link = "RosePineOrange" },
    NavicIconsArray = { link = "RosePineOrange" },
    NavicIconsObject = { link = "RosePineOrange" },
    NavicIconsKey = { link = "RosePineAqua" },
    NavicIconsNull = { link = "RosePineOrange" },
    NavicIconsEnumMember = { link = "RosePineYellow" },
    NavicIconsStruct = { link = "RosePinePurple" },
    NavicIconsEvent = { link = "RosePineYellow" },
    NavicIconsOperator = { link = "RosePineRed" },
    NavicIconsTypeParameter = { link = "RosePineRed" },
    NavicText = { link = "RosePineWhite" },
    NavicSeparator = { link = "RosePineWhite" },
    -- html
    htmlTag = { link = "RosePineAquaBold" },
    htmlEndTag = { link = "RosePineAquaBold" },
    htmlTagName = { link = "RosePineBlue" },
    htmlArg = { link = "RosePineOrange" },
    htmlTagN = { link = "RosePineFg1" },
    htmlSpecialTagName = { link = "RosePineBlue" },
    htmlLink = { fg = colors.fg4, underline = config.underline },
    htmlSpecialChar = { link = "RosePineRed" },
    htmlBold = { fg = colors.fg0, bg = colors.bg0, bold = config.bold },
    htmlBoldUnderline = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, underline = config.underline },
    htmlBoldItalic = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, italic = true },
    htmlBoldUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      bold = config.bold,
      italic = true,
      underline = config.underline,
    },
    htmlUnderline = { fg = colors.fg0, bg = colors.bg0, underline = config.underline },
    htmlUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      italic = true,
      underline = config.underline,
    },
    htmlItalic = { fg = colors.fg0, bg = colors.bg0, italic = true },
    -- xml
    xmlTag = { link = "RosePineAquaBold" },
    xmlEndTag = { link = "RosePineAquaBold" },
    xmlTagName = { link = "RosePineBlue" },
    xmlEqual = { link = "RosePineBlue" },
    docbkKeyword = { link = "RosePineAquaBold" },
    xmlDocTypeDecl = { link = "RosePineGray" },
    xmlDocTypeKeyword = { link = "RosePinePurple" },
    xmlCdataStart = { link = "RosePineGray" },
    xmlCdataCdata = { link = "RosePinePurple" },
    dtdFunction = { link = "RosePineGray" },
    dtdTagName = { link = "RosePinePurple" },
    xmlAttrib = { link = "RosePineOrange" },
    xmlProcessingDelim = { link = "RosePineGray" },
    dtdParamEntityPunct = { link = "RosePineGray" },
    dtdParamEntityDPunct = { link = "RosePineGray" },
    xmlAttribPunct = { link = "RosePineGray" },
    xmlEntity = { link = "RosePineRed" },
    xmlEntityPunct = { link = "RosePineRed" },
    -- clojure
    clojureKeyword = { link = "RosePineBlue" },
    clojureCond = { link = "RosePineOrange" },
    clojureSpecial = { link = "RosePineOrange" },
    clojureDefine = { link = "RosePineOrange" },
    clojureFunc = { link = "RosePineYellow" },
    clojureRepeat = { link = "RosePineYellow" },
    clojureCharacter = { link = "RosePineAqua" },
    clojureStringEscape = { link = "RosePineAqua" },
    clojureException = { link = "RosePineRed" },
    clojureRegexp = { link = "RosePineAqua" },
    clojureRegexpEscape = { link = "RosePineAqua" },
    clojureRegexpCharClass = { fg = colors.fg3, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "RosePineFg3" },
    clojureAnonArg = { link = "RosePineYellow" },
    clojureVariable = { link = "RosePineBlue" },
    clojureMacro = { link = "RosePineOrange" },
    clojureMeta = { link = "RosePineYellow" },
    clojureDeref = { link = "RosePineYellow" },
    clojureQuote = { link = "RosePineYellow" },
    clojureUnquote = { link = "RosePineYellow" },
    -- C
    cOperator = { link = "RosePinePurple" },
    cppOperator = { link = "RosePinePurple" },
    cStructure = { link = "RosePineOrange" },
    -- python
    pythonBuiltin = { link = "RosePineOrange" },
    pythonBuiltinObj = { link = "RosePineOrange" },
    pythonBuiltinFunc = { link = "RosePineOrange" },
    pythonFunction = { link = "RosePineAqua" },
    pythonDecorator = { link = "RosePineRed" },
    pythonInclude = { link = "RosePineBlue" },
    pythonImport = { link = "RosePineBlue" },
    pythonRun = { link = "RosePineBlue" },
    pythonCoding = { link = "RosePineBlue" },
    pythonOperator = { link = "RosePineRed" },
    pythonException = { link = "RosePineRed" },
    pythonExceptions = { link = "RosePinePurple" },
    pythonBoolean = { link = "RosePinePurple" },
    pythonDot = { link = "RosePineFg3" },
    pythonConditional = { link = "RosePineRed" },
    pythonRepeat = { link = "RosePineRed" },
    pythonDottedName = { link = "RosePineGreenBold" },
    -- CSS
    cssBraces = { link = "RosePineBlue" },
    cssFunctionName = { link = "RosePineYellow" },
    cssIdentifier = { link = "RosePineOrange" },
    cssClassName = { link = "RosePineGreen" },
    cssColor = { link = "RosePineBlue" },
    cssSelectorOp = { link = "RosePineBlue" },
    cssSelectorOp2 = { link = "RosePineBlue" },
    cssImportant = { link = "RosePineGreen" },
    cssVendor = { link = "RosePineFg1" },
    cssTextProp = { link = "RosePineAqua" },
    cssAnimationProp = { link = "RosePineAqua" },
    cssUIProp = { link = "RosePineYellow" },
    cssTransformProp = { link = "RosePineAqua" },
    cssTransitionProp = { link = "RosePineAqua" },
    cssPrintProp = { link = "RosePineAqua" },
    cssPositioningProp = { link = "RosePineYellow" },
    cssBoxProp = { link = "RosePineAqua" },
    cssFontDescriptorProp = { link = "RosePineAqua" },
    cssFlexibleBoxProp = { link = "RosePineAqua" },
    cssBorderOutlineProp = { link = "RosePineAqua" },
    cssBackgroundProp = { link = "RosePineAqua" },
    cssMarginProp = { link = "RosePineAqua" },
    cssListProp = { link = "RosePineAqua" },
    cssTableProp = { link = "RosePineAqua" },
    cssFontProp = { link = "RosePineAqua" },
    cssPaddingProp = { link = "RosePineAqua" },
    cssDimensionProp = { link = "RosePineAqua" },
    cssRenderProp = { link = "RosePineAqua" },
    cssColorProp = { link = "RosePineAqua" },
    cssGeneratedContentProp = { link = "RosePineAqua" },
    -- javascript
    javaScriptBraces = { link = "RosePineFg1" },
    javaScriptFunction = { link = "RosePineAqua" },
    javaScriptIdentifier = { link = "RosePineRed" },
    javaScriptMember = { link = "RosePineBlue" },
    javaScriptNumber = { link = "RosePinePurple" },
    javaScriptNull = { link = "RosePinePurple" },
    javaScriptParens = { link = "RosePineFg3" },
    -- typescript
    typescriptReserved = { link = "RosePineAqua" },
    typescriptLabel = { link = "RosePineAqua" },
    typescriptFuncKeyword = { link = "RosePineAqua" },
    typescriptIdentifier = { link = "RosePineOrange" },
    typescriptBraces = { link = "RosePineFg1" },
    typescriptEndColons = { link = "RosePineFg1" },
    typescriptDOMObjects = { link = "RosePineFg1" },
    typescriptAjaxMethods = { link = "RosePineFg1" },
    typescriptLogicSymbols = { link = "RosePineFg1" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "RosePineFg1" },
    typescriptParens = { link = "RosePineFg3" },
    typescriptOpSymbols = { link = "RosePineFg3" },
    typescriptHtmlElemProperties = { link = "RosePineFg1" },
    typescriptNull = { link = "RosePinePurple" },
    typescriptInterpolationDelimiter = { link = "RosePineAqua" },
    -- purescript
    purescriptModuleKeyword = { link = "RosePineAqua" },
    purescriptModuleName = { link = "RosePineFg1" },
    purescriptWhere = { link = "RosePineAqua" },
    purescriptDelimiter = { link = "RosePineFg4" },
    purescriptType = { link = "RosePineFg1" },
    purescriptImportKeyword = { link = "RosePineAqua" },
    purescriptHidingKeyword = { link = "RosePineAqua" },
    purescriptAsKeyword = { link = "RosePineAqua" },
    purescriptStructure = { link = "RosePineAqua" },
    purescriptOperator = { link = "RosePineBlue" },
    purescriptTypeVar = { link = "RosePineFg1" },
    purescriptConstructor = { link = "RosePineFg1" },
    purescriptFunction = { link = "RosePineFg1" },
    purescriptConditional = { link = "RosePineOrange" },
    purescriptBacktick = { link = "RosePineOrange" },
    -- coffescript
    coffeeExtendedOp = { link = "RosePineFg3" },
    coffeeSpecialOp = { link = "RosePineFg3" },
    coffeeCurly = { link = "RosePineOrange" },
    coffeeParen = { link = "RosePineFg3" },
    coffeeBracket = { link = "RosePineOrange" },
    -- ruby
    rubyStringDelimiter = { link = "RosePineGreen" },
    rubyInterpolationDelimiter = { link = "RosePineAqua" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    -- objc
    objcTypeModifier = { link = "RosePineRed" },
    objcDirective = { link = "RosePineBlue" },
    -- go
    goDirective = { link = "RosePineAqua" },
    goConstants = { link = "RosePinePurple" },
    goDeclaration = { link = "RosePineRed" },
    goDeclType = { link = "RosePineBlue" },
    goBuiltins = { link = "RosePineOrange" },
    -- lua
    luaIn = { link = "RosePineRed" },
    luaFunction = { link = "RosePineAqua" },
    luaTable = { link = "RosePineOrange" },
    -- moonscript
    moonSpecialOp = { link = "RosePineFg3" },
    moonExtendedOp = { link = "RosePineFg3" },
    moonFunction = { link = "RosePineFg3" },
    moonObject = { link = "RosePineYellow" },
    -- java
    javaAnnotation = { link = "RosePineBlue" },
    javaDocTags = { link = "RosePineAqua" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "RosePineFg3" },
    javaParen1 = { link = "RosePineFg3" },
    javaParen2 = { link = "RosePineFg3" },
    javaParen3 = { link = "RosePineFg3" },
    javaParen4 = { link = "RosePineFg3" },
    javaParen5 = { link = "RosePineFg3" },
    javaOperator = { link = "RosePineOrange" },
    javaVarArg = { link = "RosePineGreen" },
    -- elixir
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "RosePineGreen" },
    elixirInterpolationDelimiter = { link = "RosePineAqua" },
    elixirModuleDeclaration = { link = "RosePineYellow" },
    -- scala
    scalaNameDefinition = { link = "RosePineFg1" },
    scalaCaseFollowing = { link = "RosePineFg1" },
    scalaCapitalWord = { link = "RosePineFg1" },
    scalaTypeExtension = { link = "RosePineFg1" },
    scalaKeyword = { link = "RosePineRed" },
    scalaKeywordModifier = { link = "RosePineRed" },
    scalaSpecial = { link = "RosePineAqua" },
    scalaOperator = { link = "RosePineFg1" },
    scalaTypeDeclaration = { link = "RosePineYellow" },
    scalaTypeTypePostDeclaration = { link = "RosePineYellow" },
    scalaInstanceDeclaration = { link = "RosePineFg1" },
    scalaInterpolation = { link = "RosePineAqua" },
    -- markdown
    markdownItalic = { fg = colors.fg3, italic = true },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = true },
    markdownH1 = { link = "RosePineGreenBold" },
    markdownH2 = { link = "RosePineGreenBold" },
    markdownH3 = { link = "RosePineYellowBold" },
    markdownH4 = { link = "RosePineYellowBold" },
    markdownH5 = { link = "RosePineYellow" },
    markdownH6 = { link = "RosePineYellow" },
    markdownCode = { link = "RosePineAqua" },
    markdownCodeBlock = { link = "RosePineAqua" },
    markdownCodeDelimiter = { link = "RosePineAqua" },
    markdownBlockquote = { link = "RosePineGray" },
    markdownListMarker = { link = "RosePineGray" },
    markdownOrderedListMarker = { link = "RosePineGray" },
    markdownRule = { link = "RosePineGray" },
    markdownHeadingRule = { link = "RosePineGray" },
    markdownUrlDelimiter = { link = "RosePineFg3" },
    markdownLinkDelimiter = { link = "RosePineFg3" },
    markdownLinkTextDelimiter = { link = "RosePineFg3" },
    markdownHeadingDelimiter = { link = "RosePineOrange" },
    markdownUrl = { link = "RosePinePurple" },
    markdownUrlTitleDelimiter = { link = "RosePineGreen" },
    markdownLinkText = { fg = colors.gray, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- haskell
    haskellType = { link = "RosePineBlue" },
    haskellIdentifier = { link = "RosePineAqua" },
    haskellSeparator = { link = "RosePineFg4" },
    haskellDelimiter = { link = "RosePineOrange" },
    haskellOperators = { link = "RosePinePurple" },
    haskellBacktick = { link = "RosePineOrange" },
    haskellStatement = { link = "RosePinePurple" },
    haskellConditional = { link = "RosePinePurple" },
    haskellLet = { link = "RosePineRed" },
    haskellDefault = { link = "RosePineRed" },
    haskellWhere = { link = "RosePineRed" },
    haskellBottom = { link = "RosePineRedBold" },
    haskellImportKeywords = { link = "RosePinePurpleBold" },
    haskellDeclKeyword = { link = "RosePineOrange" },
    haskellDecl = { link = "RosePineOrange" },
    haskellDeriving = { link = "RosePinePurple" },
    haskellAssocType = { link = "RosePineAqua" },
    haskellNumber = { link = "RosePineAqua" },
    haskellPragma = { link = "RosePineRedBold" },
    haskellTH = { link = "RosePineAquaBold" },
    haskellForeignKeywords = { link = "RosePineGreen" },
    haskellKeyword = { link = "RosePineRed" },
    haskellFloat = { link = "RosePineAqua" },
    haskellInfix = { link = "RosePinePurple" },
    haskellQuote = { link = "RosePineGreenBold" },
    haskellShebang = { link = "RosePineYellowBold" },
    haskellLiquid = { link = "RosePinePurpleBold" },
    haskellQuasiQuoted = { link = "RosePineBlueBold" },
    haskellRecursiveDo = { link = "RosePinePurple" },
    haskellQuotedType = { link = "RosePineRed" },
    haskellPreProc = { link = "RosePineFg4" },
    haskellTypeRoles = { link = "RosePineRedBold" },
    haskellTypeForall = { link = "RosePineRed" },
    haskellPatternKeyword = { link = "RosePineBlue" },
    -- json
    jsonKeyword = { link = "RosePineGreen" },
    jsonQuote = { link = "RosePineGreen" },
    jsonBraces = { link = "RosePineFg1" },
    jsonString = { link = "RosePineFg1" },
    -- mail
    mailQuoted1 = { link = "RosePineAqua" },
    mailQuoted2 = { link = "RosePinePurple" },
    mailQuoted3 = { link = "RosePineYellow" },
    mailQuoted4 = { link = "RosePineGreen" },
    mailQuoted5 = { link = "RosePineRed" },
    mailQuoted6 = { link = "RosePineOrange" },
    mailSignature = { link = "Comment" },
    -- c#
    csBraces = { link = "RosePineFg1" },
    csEndColon = { link = "RosePineFg1" },
    csLogicSymbols = { link = "RosePineFg1" },
    csParens = { link = "RosePineFg3" },
    csOpSymbols = { link = "RosePineFg3" },
    csInterpolationDelimiter = { link = "RosePineFg3" },
    csInterpolationAlignDel = { link = "RosePineAquaBold" },
    csInterpolationFormat = { link = "RosePineAqua" },
    csInterpolationFormatDel = { link = "RosePineAquaBold" },
    -- rust btw
    rustSigil = { link = "RosePineOrange" },
    rustEscape = { link = "RosePineAqua" },
    rustStringContinuation = { link = "RosePineAqua" },
    rustEnum = { link = "RosePineAqua" },
    rustStructure = { link = "RosePineAqua" },
    rustModPathSep = { link = "RosePineFg2" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "RosePineAqua" },
    -- ocaml
    ocamlOperator = { link = "RosePineFg1" },
    ocamlKeyChar = { link = "RosePineOrange" },
    ocamlArrow = { link = "RosePineOrange" },
    ocamlInfixOpKeyword = { link = "RosePineRed" },
    ocamlConstructor = { link = "RosePineOrange" },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "RosePineFg1" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "RosePineFg1" },
    LspSagaAutoPreview = { link = "RosePineOrange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "RosePineAqua" },
    LspSagaDefPreviewBorder = { link = "RosePineBlue" },
    LspSagaHoverBorder = { link = "RosePineOrange" },
    LspSagaRenameBorder = { link = "RosePineBlue" },
    LspSagaDiagnosticSource = { link = "RosePineOrange" },
    LspSagaDiagnosticBorder = { link = "RosePinePurple" },
    LspSagaDiagnosticHeader = { link = "RosePineGreen" },
    LspSagaSignatureHelpBorder = { link = "RosePineGreen" },
    SagaShadow = { link = "RosePineBg0" },

    -- dashboard-nvim
    DashboardShortCut = { link = "RosePineOrange" },
    DashboardHeader = { link = "RosePineAqua" },
    DashboardCenter = { link = "RosePineYellow" },
    DashboardFooter = { fg = colors.purple, italic = true },
    -- mason
    MasonHighlight = { link = "RosePineAqua" },
    MasonHighlightBlock = { fg = colors.bg0, bg = colors.blue },
    MasonHighlightBlockBold = { fg = colors.bg0, bg = colors.blue, bold = true },
    MasonHighlightSecondary = { fg = colors.yellow },
    MasonHighlightBlockSecondary = { fg = colors.bg0, bg = colors.yellow },
    MasonHighlightBlockBoldSecondary = { fg = colors.bg0, bg = colors.yellow, bold = true },
    MasonHeader = { link = "MasonHighlightBlockBoldSecondary" },
    MasonHeaderSecondary = { link = "MasonHighlightBlockBold" },
    MasonMuted = { fg = colors.fg4 },
    MasonMutedBlock = { fg = colors.bg0, bg = colors.fg4 },
    MasonMutedBlockBold = { fg = colors.bg0, bg = colors.fg4, bold = true },
    -- lsp-inlayhints.nvim
    LspInlayHint = { link = "comment" },
    -- carbon.nvim
    CarbonFile = { link = "RosePineFg1" },
    CarbonExe = { link = "RosePineYellow" },
    CarbonSymlink = { link = "RosePineAqua" },
    CarbonBrokenSymlink = { link = "RosePineRed" },
    CarbonIndicator = { link = "RosePineGray" },
    CarbonDanger = { link = "RosePineRed" },
    CarbonPending = { link = "RosePineYellow" },
    -- noice.nvim
    NoiceCursor = { link = "TermCursor" },
    -- notify.nvim
    NotifyDEBUGBorder = { link = "RosePineBlue" },
    NotifyDEBUGIcon = { link = "RosePineBlue" },
    NotifyDEBUGTitle = { link = "RosePineBlue" },
    NotifyERRORBorder = { link = "RosePineRed" },
    NotifyERRORIcon = { link = "RosePineRed" },
    NotifyERRORTitle = { link = "RosePineRed" },
    NotifyINFOBorder = { link = "RosePineAqua" },
    NotifyINFOIcon = { link = "RosePineAqua" },
    NotifyINFOTitle = { link = "RosePineAqua" },
    NotifyTRACEBorder = { link = "RosePineGreen" },
    NotifyTRACEIcon = { link = "RosePineGreen" },
    NotifyTRACETitle = { link = "RosePineGreen" },
    NotifyWARNBorder = { link = "RosePineYellow" },
    NotifyWARNIcon = { link = "RosePineYellow" },
    NotifyWARNTitle = { link = "RosePineYellow" },

    -- ts-rainbow2 (maintained fork)
    TSRainbowRed = { fg = colors.red },
    TSRainbowOrange = { fg = colors.orange },
    TSRainbowYellow = { fg = colors.yellow },
    TSRainbowGreen = { fg = colors.green },
    TSRainbowBlue = { fg = colors.blue },
    TSRainbowViolet = { fg = colors.purple },
    TSRainbowCyan = { fg = colors.cyan },
  }

  for group, hl in pairs(config.overrides) do
    if groups[group] then
      -- "link" should not mix with other configs (:h hi-link)
      groups[group].link = nil
    end

    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

return M
