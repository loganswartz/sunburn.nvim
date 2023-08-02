local Colorscheme = require("polychrome").Colorscheme
local palette = require("sunburn.palette")


---@diagnostic disable: undefined-global
local theme = Colorscheme.define('sunburn', function()
    ---- GUI features --------------------------- {{{
    Strikethrough { gui = "strikethrough" }
    Underlined { gui = "underline" } -- (preferred) text that stands out, HTML links
    Undercurl { gui = "undercurl" }
    Reverse { gui = "reverse" }
    Standout { gui = "standout" }
    Bold { gui = "bold" }
    Italic { gui = "italic" }
    -- }}}
    ---- De Facto groups ------------------------ {{{
    -- These groups are not listed as default vim groups
    -- but they are defacto standard group names for syntax highlighting.

    -- Uncomment and edit if you want more specific syntax highlighting.

    Normal { bg = palette.bg_0, fg = palette.fg_0 }
    Comment { fg = palette.dim_0 }
    NormalFloat { fg = Normal.fg }     -- Normal text in floating windows.
    FloatBorder { fg = palette.dim_0 } -- Border of floating windows
    -- Conceal            { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor { Reverse }                 -- character under the cursor
    -- lCursor            { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM           { }, -- like Cursor, but used when in IME mode |CursorIM|
    Directory { fg = palette.cyan }    -- directory names (and other special names in listings)

    Constant { fg = palette.cyan }     -- (preferred) any constant
    String { fg = palette.green }      --   a string constant: "this is a string"
    Character { fg = palette.magenta } --  a character constant: 'c', '\n'
    Number { Constant }                --   a number constant: 234, 0xff
    Boolean { Constant }               --  a boolean constant: TRUE, false
    Float { Constant }                 --    a floating point constant: 2.3e10

    Identifier { fg = palette.blue }   -- (preferred) any variable name
    Function { Identifier }            -- function name (also: methods for classes)

    Statement { fg = palette.yellow }  -- (preferred) any statement
    Conditional { Statement }          --  if, then, else, endif, switch, etc.
    Repeat { Statement }               --   for, do, while, etc.
    Label { Statement }                --    case, default, etc.
    Operator { Statement }             -- "sizeof", "+", "*", etc.
    Keyword { Statement }              --  any other keyword
    Exception { Statement }            --  try, catch, throw

    PreProc { fg = palette.magenta }   -- (preferred) generic Preprocessor
    Include { PreProc }                --  preprocessor #include
    Define { PreProc }                 --   preprocessor #define
    Macro { PreProc }                  --    same as Define
    PreCondit { PreProc }              --  preprocessor #if, #else, #endif, etc.

    Type { fg = palette.violet }       -- (preferred) int, long, char, etc.
    StorageClass { Type }              -- static, register, volatile, etc.
    Structure { Type }                 --  struct, union, enum, etc.
    Typedef { Type }                   --  A typedef

    Special { fg = palette.orange }    -- (preferred) any special symbol
    SpecialChar { Special }            --  special character in a constant
    Tag { Special }                    --    you can use CTRL-] on this
    Delimiter { Special }              --  character that needs attention
    SpecialComment { Special }         -- special things inside a comment
    Debug { Special }                  --    debugging statements

    -- ("Ignore", below, may be invisible...)
    -- Ignore             { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Todo { fg = palette.br_red, Standout } -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Error { fg = palette.br_red }          -- (preferred) any erroneous construct

    -- Git
    diffFile { fg = palette.fg_1, Bold }
    diffIndexLine { Identifier, gui = Italic.gui }
    diffAdded { fg = palette.green }       -- diff mode: Added line |diff.txt|
    DiffAdd { diffAdded }
    diffChanged { fg = palette.yellow }    -- diff mode: Changed line |diff.txt|
    DiffChange { diffChanged }
    diffRemoved { fg = palette.red }       -- diff mode: Deleted line |diff.txt|
    DiffDelete { diffRemoved }
    DiffText { fg = palette.red, Reverse } -- diff mode: Changed text within a changed line |diff.txt|
    diffLine { Constant }
    diffSubname { fg = Normal.fg }
    diffOldFile { bg = palette.bg_1, fg = DiffDelete.fg }
    diffNewFile { bg = palette.bg_1, fg = DiffAdd.fg }

    -- TermCursor         { }, -- cursor in a focused terminal
    -- TermCursorNC       { }, -- cursor in an unfocused terminal
    ErrorMsg { Error } -- error messages on the command line
    -- VertSplit          { }, -- the column separating vertically split windows

    Folded { bg = palette.bg_1, fg = palette.dim_0 }           -- line used for closed folds
    ColorColumn { bg = palette.bg_1 }                          -- used for the columns set with 'colorcolumn'
    FoldColumn { bg = palette.bg_1, fg = palette.fg_0 }        -- 'foldcolumn'
    SignColumn { bg = palette.bg_0 }                           -- column where |signs| are displayed
    CursorColumn { bg = palette.bg_1 }                         -- used for the columns set with 'cursorcolumn'
    CursorLine { bg = palette.bg_1 }                           -- used for the row set with 'cursorline'
    CursorLineNr { fg = palette.br_violet, bg = palette.bg_1 } -- used for the row set with 'cursorline'
    LineNr { Comment }

    -- Substitute         { }, -- |:substitute| replacement text highlighting
    MatchParen { bg = palette.bg_2 } -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg            { }, -- 'showmode' message (e.g., "-- INSERT -- "
    -- MsgArea            { }, -- Area for messages and cmdline
    -- MsgSeparator       { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg            { }, -- |more-prompt|
    NonText { Comment } -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- EndOfBuffer        { }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- NormalNC           { }, -- normal text in non-current windows
    Pmenu { bg = palette.bg_1, Normal }                   -- Popup menu: normal item.
    PmenuSel { bg = palette.bg_2 }                        -- Popup menu: selected item.
    PmenuSbar { bg = palette.bg_2 }                       -- Popup menu: scrollbar.
    PmenuThumb { bg = palette.fg_0 }                      -- Popup menu: Thumb of the scrollbar.
    Question { Normal }                                   -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine       { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SpecialKey { fg = palette.br_cyan, gui = Italic.gui } -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad           { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap           { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal         { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare          { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- StatusLine         { }, -- status line of current window
    -- StatusLineNC       { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine            { }, -- tab pages line, not active tab page label
    -- TabLineFill        { }, -- tab pages line, where there are no labels
    -- TabLineSel         { }, -- tab pages line, active tab page label
    Title { fg = palette.br_violet }   -- titles for output from ":set all", ":autocmd" etc.
    Visual { bg = palette.bg_2 }       -- Visual mode selection
    -- VisualNOS          { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg { fg = palette.br_red } -- warning messages
    Whitespace { Comment }             -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu { Visual }                -- current match in 'wildmenu' completion
    Search { fg = palette.bg_0, bg = palette.br_yellow }

    -- }}}
    ---- LSP groups ----------------------------- {{{
    -- These groups are for the native LSP client. Some other LSP clients may use
    -- these groups, or use their own. Consult your LSP client's documentation.

    DiagnosticError { Error }                                       -- used for "Error" diagnostic virtual text
    LspDiagnosticsDefaultError { DiagnosticError }                  -- used for "Error" diagnostic virtual text
    LspDiagnosticsError { LspDiagnosticsDefaultError }              -- used for "Error" diagnostic virtual text
    LspDiagnosticsErrorSign { LspDiagnosticsError }                 -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsErrorFloating { LspDiagnosticsError }             -- used for "Error" diagnostic messages in the diagnostics float
    DiagnosticWarn { fg = palette.orange }                          -- used for "Warning" diagnostic virtual text
    LspDiagnosticsDefaultWarning { DiagnosticWarn }
    LspDiagnosticsWarning { LspDiagnosticsDefaultWarning }          -- used for "Warning" diagnostic virtual text
    LspDiagnosticsWarningSign { LspDiagnosticsWarning }             -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsWarningFloating { LspDiagnosticsWarning }         -- used for "Warning" diagnostic messages in the diagnostics float
    DiagnosticInfo { fg = palette.blue }                            -- used for "Information" diagnostic virtual text
    LspDiagnosticsDefaultInformation { DiagnosticInfo }
    LspDiagnosticsInformation { LspDiagnosticsDefaultInformation }  -- used for "Information" diagnostic virtual text
    LspDiagnosticsInformationSign { LspDiagnosticsInformation }     -- used for "Information" signs in sign column
    LspDiagnosticsInformationFloating { LspDiagnosticsInformation } -- used for "Information" diagnostic messages in the diagnostics float
    DiagnosticHint { fg = palette.dim_0 }                           -- used for "Hint" diagnostic virtual text
    LspDiagnosticsDefaultHint { DiagnosticHint }
    LspDiagnosticsHint { LspDiagnosticsDefaultHint }                -- used for "Hint" diagnostic virtual text
    LspDiagnosticsHintSign { LspDiagnosticsHint }                   -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsHintFloating { LspDiagnosticsHint }               -- used for "Hint" diagnostic messages in the diagnostics float
    -- LspReferenceText                     { }, -- used for highlighting "text" references
    -- LspReferenceRead                     { }, -- used for highlighting "read" references
    -- LspReferenceWrite                    { }, -- used for highlighting "write" references
    DiagnosticUnderlineError { DiagnosticError, gui = Underlined.gui }
    DiagnosticUnderlineWarn { DiagnosticWarn, gui = Underlined.gui }
    DiagnosticUnderlineInfo { DiagnosticInfo, gui = Underlined.gui }
    DiagnosticUnderlineHint { DiagnosticHint, gui = Underlined.gui }
    LspDiagnosticsVirtualTextError { LspDiagnosticsError }
    LspDiagnosticsVirtualTextWarning { LspDiagnosticsWarning }
    LspDiagnosticsVirtualTextInformation { LspDiagnosticsInformation }
    LspDiagnosticsVirtualTextHint { LspDiagnosticsHint }

    LspSignatureActiveParameter { WildMenu }
    -- }}}
    ---- Treesitter groups ---------------------- {{{
    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group.
    --
    -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights

    --- Misc {{{
    -- _ "@comment"               { }, -- line and block comments
    _ "@error" { Error } -- syntax/parser errors
    -- _ "@none"                  { }, -- completely disable the highlight
    -- _ "@preproc"               { }, -- various preprocessor directives & shebangs
    -- _ "@define"                { }, -- preprocessor definition directives
    -- _ "@operator"              { }, -- symbolic operators (e.g. `+` / `*`)

    -- }}}
    --- Punctuation {{{
    -- _ "@punctuation.delimiter" { }, -- For delimiters ie: `.`
    -- _ "@punctuation.bracket"   { }, -- For brackets and parens.
    -- _ "@punctuation.special"   { }, -- For special punctuation that does not fall in the categories before.

    -- }}}
    --- Literals {{{
    -- _ "@string"                { }, -- string literals
    -- _ "@string.regex"          { }, -- regular expressions
    -- _ "@string.escape"         { }, -- escape sequences
    -- _ "@string.special"        { }, -- other special strings (e.g. dates)

    -- _ "@character"             { }, -- character literals
    -- _ "@character.special"     { }, -- special characters (e.g. wildcards)

    -- _ "@boolean"               { }, -- boolean literals
    -- _ "@number"                { }, -- numeric literals
    -- _ "@float"                 { }, -- floating-point number literals

    -- }}}
    --- Functions {{{
    -- _ "@function"              { }, -- function definitions
    -- _ "@function.builtin"      { }, -- built-in functions
    -- _ "@function.call"         { }, -- function calls
    -- _ "@function.macro"        { }, -- preprocessor macros

    -- _ "@method"                { }, -- method definitions
    -- _ "@method.call"           { }, -- method calls

    _ "@constructor" { Type } -- constructor calls and definitions
    -- _ "@parameter"             { }, -- parameters of a function

    -- }}}
    --- Keywords {{{
    -- _ "@keyword"               { }, -- various keywords
    _ "@keyword.function" { fg = palette.red } -- keywords that define a function (e.g. `func` in Go, `def` in Python)
    -- _ "@keyword.operator"      { }, -- operators that are English words (e.g. `and` / `or`)
    -- _ "@keyword.return"        { }, -- keywords like `return` and `yield`

    -- _ "@conditional"           { }, -- keywords related to conditionals (e.g. `if` / `else`)
    -- _ "@repeat"                { }, -- keywords related to loops (e.g. `for` / `while`)
    -- _ "@debug"                 { }, -- keywords related to debugging
    -- _ "@label"                 { }, -- GOTO and other labels (e.g. `label:` in C)
    -- _ "@include"               { }, -- keywords for including modules (e.g. `import` / `from` in Python)
    -- _ "@exception"             { }, -- keywords related to exceptions (e.g. `throw` / `catch`)

    -- }}}
    --- Types {{{
    -- _ "@type"                  { }, -- type or class definitions and annotations
    -- _ "@type.builtin"          { }, -- built-in types
    -- _ "@type.definition"       { }, -- type definitions (e.g. `typedef` in C)
    -- _ "@type.qualifier"        { }, -- type qualifiers (e.g. `const`)

    -- _ "@storageclass"          { }, -- visibility/life-time/etc. modifiers (e.g. `static`)
    -- _ "@attribute"             { }, -- attribute annotations (e.g. Python decorators)
    _ "@field" { fg = Normal.fg } -- object and struct fields
    _ "@property" { _ "@field" }  -- similar to `@field`

    -- }}}
    --- Identifiers {{{
    -- _ "@variable"              { }, -- various variable names
    _ "@variable.builtin" { fg = palette.magenta } -- built-in variable names (e.g. `this`)

    -- _ "@constant"              { }, -- constant identifiers
    -- _ "@constant.builtin"      { }, -- built-in constant values
    -- _ "@constant.macro"        { }, -- constants defined by the preprocessor")

    -- _ "@namespace"             { }, -- modules or namespaces
    -- _ "@symbol"                { }, -- symbols or atoms

    -- }}}
    --- Text {{{
    -- _ "@text"                  { }, -- non-structured text
    _ "@text.strong" { Bold }          -- bold text
    _ "@text.emphasis" { Bold }        -- text with emphasis
    -- _ "@text.underline"        { }, -- underlined text
    _ "@text.strike" { Strikethrough } -- strikethrough text
    _ "@text.title" { Title }          -- text that is part of a title
    -- _ "@text.literal"          { }, -- literal or verbatim text
    _ "@text.uri" { Underlined }       -- URIs (e.g. hyperlinks)
    -- _ "@text.math"             { }, -- math environments (e.g. `$ ... $` in LaTeX)
    -- _ "@text.environment"      { }, -- text environments of markup languages
    -- _ "@text.environment.name" { }, -- text indicating the type of an environment
    -- _ "@text.reference"        { }, -- text references, footnotes, citations, etc.

    _ "@text.todo" { Todo, fg = DiagnosticHint.fg }    -- todo notes
    _ "@text.note" { Todo, fg = DiagnosticInfo.fg }    -- info notes
    _ "@text.warning" { Todo, fg = DiagnosticWarn.fg } -- warning notes
    _ "@text.danger" { Todo, fg = DiagnosticError.fg } -- danger/error notes

    _ "@text.diff.add" { diffAdded }                   -- diff mode: Added line
    _ "@text.diff.delete" { diffRemoved }              -- diff mode: Deleted line

    -- }}}
    --- Tags {{{
    _ "@tag" { fg = palette.red }              -- XML tag names
    _ "@tag.attribute" { Identifier }          -- XML tag attributes
    _ "@tag.delimiter" { fg = palette.yellow } -- XML tag delimiters

    -- }}}
    -- }}}
    ---- 3rd party highlights ------------------- {{{
    --- hrsh7th/nvim-cmp {{{
    CmpItemMenu { Type }

    CmpItemAbbrDeprecated { gui = Strikethrough.gui }
    CmpItemAbbrMatch { Identifier }
    CmpItemAbbrMatchFuzzy { CmpItemAbbrMatch }

    CmpItemKindText { fg = Normal.fg }
    CmpItemKindMethod { Special }
    CmpItemKindFunction { CmpItemKindMethod }
    CmpItemKindConstructor { Type }
    -- CmpItemKindField          { }
    CmpItemKindVariable { Identifier }
    CmpItemKindClass { Type }
    CmpItemKindInterface { CmpItemKindVariable }
    CmpItemKindModule { PreProc }
    CmpItemKindProperty { Identifier }
    CmpItemKindUnit { Special }
    -- CmpItemKindValue          { }
    CmpItemKindKeyword { Keyword }
    -- CmpItemKindSnippet        { }
    -- CmpItemKindColor          { }
    CmpItemKindFile { PreProc }
    -- CmpItemKindReference      { }
    CmpItemKindFolder { Directory }
    -- CmpItemKindEnum           { }
    -- CmpItemKindEnumMember     { }
    CmpItemKindConstant { Constant }
    -- CmpItemKindStruct         { }
    -- CmpItemKindEvent          { }
    CmpItemKindOperator { Operator }
    -- CmpItemKindTypeParameter  { }

    -- }}}
    --- lukas-reineke/indent-blankline.nvim {{{
    IndentBlanklineContextChar { fg = palette.blue }

    -- }}}
    --- lewis6991/gitsigns.nvim {{{
    GitSignsAdd { bg = Normal.bg, fg = DiffAdd.fg }
    GitSignsChange { bg = Normal.bg, fg = DiffChange.fg }
    GitSignsDelete { bg = Normal.bg, fg = DiffDelete.fg }

    -- }}}
    --- tpope/vim-fugitive {{{
    gitcommitSummary { Identifier }
    gitcommitOverflow { DiagnosticWarn }

    -- }}}

    -- }}}
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap:number
