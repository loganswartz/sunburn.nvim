local Colorscheme = require("polychrome").Colorscheme
local palette = require("sunburn.palette")

---@diagnostic disable: undefined-global
local theme = Colorscheme.define('sunburn', function()
    ---- Main UI -------------------------------- {{{
    -- Highlights used for parts of the Neovim UI (statusline, tabline, etc.)

    Normal { bg = palette.bg_0, fg = palette.fg_0 }
    NormalFloat { bg = palette.bg_1 }
    FloatBorder { bg = palette.bg_1 }
    -- FloatShadow { }
    -- FloatShadowThrough { }
    Conceal { fg = palette.fg_1, bg = palette.dim_0 }
    Cursor { Reverse }
    -- lCursor { }
    -- CursorIM { }
    Directory { fg = palette.cyan }
    netrwClassify { fg = palette.fg_0 }

    -- ("Ignore", below, may be invisible...)
    -- Ignore { }

    Todo { fg = palette.br_red, Standout }
    Error { fg = palette.br_red }

    -- Git
    diffFile { fg = palette.fg_1, Bold }
    diffIndexLine { Identifier, Italic }
    DiffAdd { fg = palette.green }
    diffAdded { DiffAdd }
    DiffChange { fg = palette.yellow }
    diffChanged { DiffChange }
    diffRemoved { fg = palette.red }
    DiffDelete { diffRemoved }
    DiffText { fg = DiffDelete.fg, Reverse }

    diffLine { Constant }
    diffSubname { fg = Normal.fg }
    diffOldFile { bg = palette.bg_1, fg = DiffDelete.fg }
    diffNewFile { bg = palette.bg_1, fg = DiffAdd.fg }

    -- TermCursor { }
    -- TermCursorNC { }
    ErrorMsg { Error }
    -- VertSplit { }

    Folded { bg = palette.bg_1, fg = palette.dim_0 }
    ColorColumn { NormalFloat }
    FoldColumn { bg = palette.bg_1, fg = palette.fg_0 }
    SignColumn { bg = palette.bg_0 }
    CursorColumn { bg = palette.bg_1 }
    CursorLine { bg = palette.bg_1 }
    CursorLineNr { fg = palette.br_violet, bg = palette.bg_1 }
    LineNr { Comment }

    MatchParen { bg = palette.bg_2 }
    -- ModeMsg { }
    -- MsgArea { }
    -- MsgSeparator { }
    -- MoreMsg { }
    -- NonText { }
    -- EndOfBuffer { }
    -- NormalNC { }
    Pmenu { bg = palette.bg_1 }
    -- PmenuMatch { }
    -- PmenuMatchSel { }
    PmenuSel { bg = palette.bg_2 }
    PmenuSbar { bg = palette.bg_2 }
    PmenuThumb { bg = palette.dim_0 }
    Question { fg = palette.br_violet }
    SpecialKey { fg = palette.br_cyan, Italic }
    -- SpellBad { }
    -- SpellCap { }
    -- SpellLocal { }
    -- SpellRare { }
    -- StatusLine { }
    -- StatusLineNC { }
    TabLine { bg = palette.bg_1 }
    TabLineFill { bg = TabLine.bg }
    TabLineSel { fg = TabLine.fg, bg = palette.bg_2, Bold }
    -- WinBar { }
    -- WinBarNC { }
    Title { fg = palette.br_violet }
    Visual { bg = palette.bg_2 }
    -- VisualNOS { }
    WarningMsg { fg = palette.br_red }
    Whitespace { Comment }
    WildMenu { Visual }
    Search { fg = palette.bg_0, bg = palette.yellow }
    CurSearch { fg = palette.bg_0, bg = palette.br_yellow }
    -- QuickFixLine { }
    -- Substitute { }

    RedrawDebugClear { bg = palette.yellow, fg = palette.bg_2 }
    RedrawDebugComposed { bg = palette.green, fg = palette.bg_2 }
    RedrawDebugNormal { bg = palette.fg_0, fg = palette.bg_0 }
    RedrawDebugRecompose { bg = palette.red, fg = palette.bg_2 }

    -- }}}
    ---- Syntax --------------------------------- {{{
    -- Many of the de facto standard group names for syntax highlighting.

    Comment { fg = palette.dim_0 }

    Constant { fg = palette.cyan }
    String { fg = palette.green }
    Character { fg = palette.magenta }
    -- Number { }
    -- Boolean { }
    -- Float { }

    Identifier { fg = palette.blue }
    Function { Identifier }

    Statement { fg = palette.yellow }
    -- Conditional { }
    -- Repeat { }
    -- Label { }
    Operator { Statement }
    Keyword { Statement }
    -- Exception { }

    PreProc { fg = palette.magenta }
    -- Include { }
    -- Define { }
    -- Macro { }
    -- PreCondit { }

    Type { fg = palette.violet }
    -- StorageClass { }
    -- Structure { }
    -- Typedef { }

    Special { fg = palette.orange }
    -- SpecialChar { }
    -- Tag { }
    Delimiter { Special }
    -- SpecialComment { }
    -- Debug { }

    -- }}}
    ---- Diagnostics ---------------------------- {{{
    -- Highlights for diagnostics from any source (LSP, other plugins, etc.)
    --
    -- https://neovim.io/doc/user/diagnostic.html#diagnostic-highlights

    DiagnosticError { Error }
    DiagnosticHint { Comment }
    DiagnosticInfo { fg = palette.blue }
    DiagnosticOk { fg = palette.green }
    DiagnosticWarn { fg = palette.orange }
    -- DiagnosticFloatingError { }
    -- DiagnosticFloatingHint { }
    -- DiagnosticFloatingInfo { }
    -- DiagnosticFloatingOk { }
    -- DiagnosticFloatingWarn { }
    -- DiagnosticSignError { }
    -- DiagnosticSignHint { }
    -- DiagnosticSignInfo { }
    -- DiagnosticSignOk { }
    -- DiagnosticSignWarn { }
    -- DiagnosticUnderlineError { }
    -- DiagnosticUnderlineHint { }
    -- DiagnosticUnderlineInfo { }
    -- DiagnosticUnderlineOk { }
    -- DiagnosticUnderlineWarn { }
    -- DiagnosticVirtualTextError { }
    -- DiagnosticVirtualTextHint { }
    -- DiagnosticVirtualTextInfo { }
    -- DiagnosticVirtualTextOk { }
    -- DiagnosticVirtualTextWarn { }
    -- DiagnosticDeprecated { }
    -- DiagnosticUnnecessary { }

    -- }}}
    ---- LSP ------------------------------------ {{{
    -- These groups are for the native LSP client. Some other LSP clients may use
    -- these groups, or use their own. Consult your LSP client's documentation.
    --
    -- https://neovim.io/doc/user/lsp.html#_lsp-highlight

    -- LspReferenceText { }
    -- LspReferenceRead { }
    -- LspReferenceWrite { }
    -- LspReferenceTarget { }
    -- LspInlayHint { }
    -- LspCodeLens { }
    -- LspCodeLensSeparator { }
    -- LspSignatureActiveParameter { }

    -- }}}
    ---- Treesitter ----------------------------- {{{
    -- By default, most of these groups link to an appropriate Vim group.
    --
    -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights

    -- _ "@comment" { }
    _ "@error" { Error }
    -- _ "@none" { }
    -- _ "@keyword.directive" { }
    -- _ "@keyword.directive.define" { }
    -- _ "@operator" { }

    -- _ "@punctuation.delimiter" { }
    -- _ "@punctuation.bracket" { }
    -- _ "@punctuation.special" { }

    -- _ "@string" { }
    -- _ "@string.regexp" { }
    -- _ "@string.escape" { }
    -- _ "@string.special" { }

    -- _ "@character" { }
    -- _ "@character.special" { }

    -- _ "@boolean" { }
    -- _ "@number" { }
    -- _ "@number.float" { }

    -- _ "@function" { }
    -- _ "@function.builtin" { }
    -- _ "@function.call" { }
    -- _ "@function.macro" { }

    -- _ "@function.method" { }
    -- _ "@function.method.call" { }

    _ "@constructor" { Type }
    -- _ "@variable.parameter" { }

    -- _ "@keyword" { }
    _ "@keyword.function" { fg = palette.red }
    -- _ "@keyword.operator" { }
    -- _ "@keyword.return" { }

    -- _ "@keyword.conditional" { }
    -- _ "@keyword.repeat" { }
    -- _ "@keyword.debug" { }
    -- _ "@label" { }
    -- _ "@keyword.include" { }
    -- _ "@keyword.exception" { }

    -- _ "@type" { }
    -- _ "@type.builtin" { }
    -- _ "@type.definition" { }
    -- _ "@type.qualifier" { }

    -- _ "@keyword.storage" { }
    -- _ "@attribute" { }
    _ "@variable.member" { fg = Normal.fg }
    _ "@property" { _ "@variable.member" }

    _ "@variable" { fg = palette.fg_0 }
    _ "@variable.builtin" { fg = palette.magenta }

    -- _ "@constant" { }
    -- _ "@constant.builtin" { }
    -- _ "@constant.macro" { }

    -- _ "@module" { }

    -- _ "@markup" { }
    -- _ "@markup.strong" { }
    -- _ "@markup.italic" { }
    -- _ "@markup.underline" { }
    -- _ "@markup.strikethrough" { }
    -- _ "@markup.heading" { }
    -- _ "@markup.raw" { }
    -- _ "@markup.quote" { }
    -- _ "@markup.math" { }
    -- _ "@markup.environment" { }
    -- _ "@markup.environment.name" { }
    -- _ "@markup.link" { }
    _ "@markup.link.label" { Bold }
    -- _ "@markup.link.url" { }
    -- _ "@markup.list" { }
    -- _ "@markup.list.unnumbered" { }
    -- _ "@markup.list.numbered" { }
    _ "@markup.list.checked" { fg = palette.green }
    _ "@markup.list.unchecked" { fg = palette.red }

    -- _ "@string.special.symbol" { }
    -- _ "@string.special.url" { }
    _ "@string.documentation" { Comment }

    _ "@comment.todo" { Todo, fg = DiagnosticHint.fg }
    _ "@comment.note" { Todo, fg = DiagnosticInfo.fg }
    _ "@comment.warning" { Todo, fg = DiagnosticWarn.fg }
    _ "@comment.error" { Todo, fg = DiagnosticError.fg }

    _ "@diff.plus" { DiffAdd }
    _ "@diff.plus.gutter" { _ "@diff.plus" }
    _ "@diff.minus" { DiffDelete }
    _ "@diff.minus.gutter" { _ "@diff.minus" }
    _ "@diff.delta" { DiffChange }
    -- _ "@diff.delta.moved" { }
    -- _ "@diff.delta.conflict" { }
    _ "@diff.delta.gutter" { _ "@diff.delta" }

    _ "@tag" { fg = palette.red }
    _ "@tag.attribute" { Identifier }
    _ "@tag.delimiter" { fg = palette.yellow }

    -- }}}
    ---- 3rd Party Plugins ---------------------- {{{
    --- hrsh7th/nvim-cmp {{{

    CmpItemAbbrDeprecated { strikethrough }
    -- CmpItemAbbrDeprecatedDefault { }
    CmpItemAbbrMatch { Identifier }
    CmpItemAbbrMatchFuzzy { CmpItemAbbrMatch }
    CmpItemKindClass { Type }
    -- CmpItemKindColor { }
    CmpItemKindConstant { Constant }
    CmpItemKindConstructor { Type }
    -- CmpItemKindDefault { }
    -- CmpItemKindEnum { }
    -- CmpItemKindEnumMember { }
    -- CmpItemKindEvent { }
    -- CmpItemKindField { }
    CmpItemKindFile { PreProc }
    CmpItemKindFolder { Directory }
    CmpItemKindFunction { CmpItemKindMethod }
    CmpItemKindInterface { CmpItemKindVariable }
    CmpItemKindKeyword { Keyword }
    CmpItemKindMethod { Special }
    CmpItemKindModule { PreProc }
    CmpItemKindOperator { Operator }
    CmpItemKindProperty { Identifier }
    -- CmpItemKindReference { }
    -- CmpItemKindSnippet { }
    -- CmpItemKindStruct { }
    CmpItemKindText { fg = Normal.fg }
    -- CmpItemKindTypeParameter { }
    CmpItemKindUnit { Special }
    -- CmpItemKindValue { }
    CmpItemKindVariable { Identifier }
    CmpItemMenu { Type }

    -- }}}
    --- lukas-reineke/indent-blankline.nvim {{{

    -- IblIndent { }
    IblScope { fg = palette.violet }
    -- IblWhitespace { }

    -- }}}
    --- lewis6991/gitsigns.nvim {{{

    GitSignsAdd { _ "@diff.plus.gutter" }
    -- GitSignsAddCul { }
    -- GitSignsAddInline { }
    -- GitSignsAddLn { }
    -- GitSignsAddLnInline { }
    -- GitSignsAddNr { }
    -- GitSignsAddPreview { }
    GitSignsChange { _ "@diff.delta.gutter" }
    -- GitSignsChangeCul { }
    -- GitSignsChangeInline { }
    -- GitSignsChangeLn { }
    -- GitSignsChangeLnInline { }
    -- GitSignsChangeNr { }
    -- GitSignsChangedelete { }
    -- GitSignsChangedeleteCul { }
    -- GitSignsChangedeleteLn { }
    -- GitSignsChangedeleteNr { }
    -- GitSignsCurrentLineBlame { }
    GitSignsDelete { _ "@diff.minus.gutter" }
    -- GitSignsDeleteCul { }
    -- GitSignsDeleteInline { }
    -- GitSignsDeleteLnInline { }
    -- GitSignsDeleteNr { }
    -- GitSignsDeletePreview { }
    -- GitSignsDeleteVirtLn { }
    -- GitSignsDeleteVirtLnInLine { }
    -- GitSignsStagedAdd { }
    -- GitSignsStagedAddCul { }
    -- GitSignsStagedAddLn { }
    -- GitSignsStagedAddNr { }
    -- GitSignsStagedChange { }
    -- GitSignsStagedChangeCul { }
    -- GitSignsStagedChangeLn { }
    -- GitSignsStagedChangeNr { }
    -- GitSignsStagedChangedelete { }
    -- GitSignsStagedChangedeleteCul { }
    -- GitSignsStagedChangedeleteLn { }
    -- GitSignsStagedChangedeleteNr { }
    -- GitSignsStagedDelete { }
    -- GitSignsStagedDeleteCul { }
    -- GitSignsStagedDeleteNr { }
    -- GitSignsStagedTopdelete { }
    -- GitSignsStagedTopdeleteCul { }
    -- GitSignsStagedTopdeleteLn { }
    -- GitSignsStagedTopdeleteNr { }
    -- GitSignsStagedUntracked { }
    -- GitSignsStagedUntrackedCul { }
    -- GitSignsStagedUntrackedLn { }
    -- GitSignsStagedUntrackedNr { }
    -- GitSignsTopdelete { }
    -- GitSignsTopdeleteCul { }
    -- GitSignsTopdeleteLn { }
    -- GitSignsTopdeleteNr { }
    -- GitSignsUntracked { }
    -- GitSignsUntrackedCul { }
    -- GitSignsUntrackedLn { }
    -- GitSignsUntrackedNr { }
    -- GitSignsVirtLnum { }

    -- }}}
    --- tpope/vim-fugitive {{{

    -- gitcommitSummary { }
    -- gitcommitOverflow { }

    -- }}}
    --- folke/lazy.nvim {{{

    LazyNormal { NormalFloat, blend = 10 }
    -- LazyBackdrop { }
    -- LazyBold { }
    -- LazyItalic { }

    -- }}}
    --- williamboman/mason.nvim {{{

    -- MasonHeader { }
    -- MasonHeaderSecondary { }
    -- MasonHeading { }
    -- MasonHighlight { }
    -- MasonHighlightBlock { }
    -- MasonHighlightBlockBold { }
    -- MasonHighlightBlockBoldSecondary { }
    -- MasonHighlightBlockSecondary { }
    -- MasonHighlightSecondary { }
    -- MasonMuted { }
    -- MasonMutedBlock { }
    -- MasonMutedBlockBold { }

    -- }}}
    --- lewis6991/hover.nvim {{{

    -- HoverWindow { }

    -- }}}
    --- rcarriga/nvim-dap-ui {{{

    -- DapUIBreakpointsCurrentLine { }
    -- DapUIBreakpointsDisabledLine { }
    -- DapUIBreakpointsInfo { }
    -- DapUIBreakpointsPath { }
    -- DapUIDecoration { }
    -- DapUIFloatBorder { }
    -- DapUILineNumber { }
    -- DapUIModifiedValue { }
    -- DapUIPlayPause { }
    -- DapUIPlayPauseNC { }
    -- DapUIRestart { }
    -- DapUIRestartNC { }
    -- DapUIScope { }
    -- DapUISource { }
    -- DapUIStepBack { }
    -- DapUIStepBackNC { }
    -- DapUIStepInto { }
    -- DapUIStepIntoNC { }
    -- DapUIStepOut { }
    -- DapUIStepOutNC { }
    -- DapUIStepOver { }
    -- DapUIStepOverNC { }
    -- DapUIStop { }
    -- DapUIStopNC { }
    -- DapUIStoppedThread { }
    -- DapUIThread { }
    -- DapUIType { }
    -- DapUIUnavailable { }
    -- DapUIUnavailableNC { }
    -- DapUIWatchesEmpty { }
    -- DapUIWatchesError { }
    -- DapUIWatchesValue { }
    -- DapUIWinSelect { }

    -- }}}

    -- }}}
end)

return theme
