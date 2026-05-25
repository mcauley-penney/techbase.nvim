local tint = require("techbase.utils").tint

return function(c)
  local hl = {}

  -- ************** UI **************
  -- windows
  hl["Normal"] = { fg = c.normal_fg, bg = c.normal_bg }
  hl["NormalFloat"] = { fg = c.float_fg, bg = c.float_bg }
  hl["FloatBorder"] = { fg = c.float_border_fg, bg = c.float_bg }
  hl["FloatTitle"] = { fg = c.important, bg = c.float_bg }
  hl["WinSeparator"] = { fg = c.normal_embed_bg }

  -- diff
  hl["Added"] = { fg = c.git_add_fg, bg = c.git_add_bg }
  hl["Changed"] = { fg = c.git_change_fg, bg = c.git_change_bg }
  hl["Removed"] = { fg = c.git_delete_fg, bg = c.git_delete_bg }

  -- elements
  hl["ColorColumn"] = { bg = c.normal_embed_bg }
  hl["Conceal"] = { fg = "fg" }
  hl["CurSearch"] = { fg = c.normal_bg, bg = c.number }
  hl["Cursor"] = { bg = c.cursor }
  hl["CursorLine"] = { bg = c.normal_embed_bg }
  hl["CursorLineNr"] = { fg = "fg" }
  hl["Delimiter"] = { fg = "fg" }
  hl["Directory"] = { fg = c.important }
  hl["EndOfBuffer"] = { link = "NonText" }
  hl["Error"] = { fg = c.error }
  hl["ErrorMsg"] = { link = "Error" }
  hl["FoldColumn"] = { link = "NonText" }
  hl["Folded"] = { fg = c.keyword, bg = c.normal_embed_bg }
  hl["IncSearch"] = { link = "Search" }
  hl["LineNr"] = { link = "NonText" }
  hl["MatchParen"] = { fg = c.search, bg = c.normal_embed_bg }
  hl["ModeMsg"] = { fg = c.constant }
  hl["MoreMsg"] = { link = "ModeMsg" }
  hl["MsgArea"] = { fg = "fg" }
  hl["MsgSeparator"] = { fg = c.float_bg }
  hl["NonText"] = { fg = c.nontext_fg }
  hl["Pmenu"] = { fg = c.float_fg, bg = c.float_bg }
  hl["PmenuMatch"] = { fg = c.important }
  hl["PmenuSbar"] = { link = "Pmenu" }
  hl["PmenuSel"] = { bg = c.float_bg_select }
  hl["PmenuMatchSel"] = { link = "PmenuSel" }
  hl["PmenuThumb"] = { bg = c.nontext_fg }
  hl["Question"] = { fg = c.string }
  hl["QuickFixLine"] = { link = "Search" }
  hl["Search"] = { fg = c.normal_bg, bg = c.search }
  hl["SignColumn"] = { fg = "fg" }
  hl["SpecialChar"] = { link = "Special" }
  hl["SpecialComment"] = { fg = c.search }
  hl["SpecialKey"] = { fg = c.search }
  hl["StatusLine"] = { fg = c.normal_fg }
  hl["StatusLineNC"] = {}
  hl["Substitute"] = { fg = c.string, bg = c.normal_embed_bg }
  hl["TabLine"] = { fg = c.comment_fg, bg = c.normal_bg }
  hl["TabLineFill"] = { fg = c.nontext_fg, bg = c.normal_bg }
  hl["TabLineSel"] = { fg = c.important }
  hl["TermCursor"] = { link = "Cursor" }
  hl["Title"] = { link = "Directory" }
  hl["Todo"] = { link = "SpecialComment" }
  hl["Visual"] = { bg = c.v_select }
  hl["WarningMsg"] = { link = "Error" }
  hl["Whitespace"] = { link = "NonText" }
  hl["WinBar"] = { fg = c.float_fg }
  hl["WinBarNC"] = { link = "WinBar" }

  -- ************** SYNTAX **************
  hl["Comment"] = { fg = c.comment_fg }
  hl["Constant"] = { fg = c.constant }
  hl["Function"] = { fg = c.important }
  hl["Keyword"] = { fg = c.keyword }
  hl["Number"] = { fg = c.number }
  hl["Operator"] = { fg = c.operator }
  hl["String"] = { fg = c.string }
  hl["Type"] = { fg = c.keyword }

  hl["Boolean"] = { link = "Constant" }
  hl["Character"] = { link = "String" }
  hl["Conditional"] = { link = "Statement" }
  hl["Define"] = { link = "PreProc" }
  hl["Exception"] = { link = "Statement" }
  hl["Float"] = { link = "Number" }
  hl["Identifier"] = { fg = "fg" }
  hl["Include"] = { link = "PreProc" }
  hl["Label"] = { link = "Conditional" }
  hl["Macro"] = { link = "PreProc" }
  hl["PreCondit"] = { link = "PreProc" }
  hl["PreProc"] = { fg = "fg" }
  hl["Repeat"] = { link = "Conditional" }
  hl["Special"] = { fg = "fg" }
  hl["Statement"] = { link = "Keyword" }
  hl["StorageClass"] = { link = "Type" }
  hl["Structure"] = { link = "Type" }
  hl["Tag"] = { fg = "fg" }
  hl["Typedef"] = { link = "Type" }

  -- ************** FILETYPE **************
  -- diff
  hl["DiffAdd"] = { link = "Added" }
  hl["DiffChange"] = { link = "Changed" }
  hl["DiffDelete"] = { link = "Removed" }
  hl["DiffText"] = { bg = c.important }

  -- Gitcommit diffs
  -- https://github.com/vim/vim/blob/c54f347d63bcca97ead673d01ac6b59914bb04e5/runtime/syntax/diff.vim
  hl["diffAdded"] = { link = "Added" }
  hl["diffChanged"] = { link = "Changed" }
  hl["diffRemoved"] = { link = "Removed" }

  -- Gitcommit (info above the diff in a commit)
  -- https://github.com/vim/vim/blob/2f0936cb9a2eb026acac03e6a8fd0b2a5d97508b/runtime/syntax/gitcommit.vim
  hl["gitcommitHeader"] = {}
  hl["gitcommitOnBranch"] = {}
  hl["gitcommitType"] = { fg = c.constant }

  hl["gitcommitArrow"] = { link = "Statement" }
  hl["gitcommitBlank"] = { link = "Added" }
  hl["gitcommitBranch"] = { link = "Added" }
  hl["gitcommitDiscarded"] = { link = "Added" }
  hl["gitcommitDiscardedFile"] = { link = "Added" }
  hl["gitcommitDiscardedType"] = { link = "Removed" }
  hl["gitcommitSummary"] = { link = "Directory" }
  hl["gitcommitUnmerged"] = { link = "Added" }

  -- Help
  -- https://github.com/vim/vim/blob/2d8ed0203aedd5f6c22efa99394a3677c17c7a7a/runtime/syntax/help.vim
  hl["helpCommand"] = { fg = "fg" }
  hl["helpExample"] = { link = "String" }
  hl["helpHyperTextEntry"] = { link = "Directory" }
  hl["helpOption"] = { fg = "fg" }
  hl["helpVim"] = { fg = "fg" }

  -- Markdown
  hl["markdownBlockquote"] = { fg = c.quote_fg }
  hl["markdownCodeBlock"] = { bg = c.normal_embed_bg }
  hl["markdownHeadingRule"] = { link = "markdownRule" }
  hl["markdownLinkText"] = { link = "String" }
  hl["markdownListMarker"] = { fg = "fg" }
  hl["markdownRule"] = { link = "NonText" }
  hl["markdownUrl"] = { link = "@text.uri" }

  -- ini
  hl["dosiniHeader"] = { link = "@markup.heading.1.markdown" }
  hl["dosiniLabel"] = { link = "@property" }

  -- ************** TREESITTER **************
  -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights
  hl["@constant.builtin"] = { link = "Constant" }
  hl["@function.call"] = { fg = "fg" }
  hl["@function.method.call"] = { fg = "fg" }
  hl["@markup.heading"] = { link = "Function" }
  hl["@markup.raw.block"] = { link = "markdownCodeBlock" }
  hl["@method.call"] = { fg = "fg" }
  hl["@module"] = { fg = "fg" }
  hl["@namespace"] = { fg = c.important }
  hl["@number.comment"] = { link = "Comment" }
  hl["@property"] = { fg = "fg" }
  hl["@punctuation"] = { fg = "fg" }
  hl["@string.documentation"] = { link = "Comment" }
  hl["@string.escape"] = { link = "@string.regex" }
  hl["@string.regex"] = { fg = c.raw_string }
  hl["@string.special.symbol"] = { link = "@string.regex" }
  hl["@text.literal"] = { fg = "fg" }
  hl["@text.reference"] = { link = "String" }
  hl["@text.uri"] = { fg = c.keyword, underline = true }
  hl["@type.builtin"] = { link = "@type" }

  -- Latex
  hl["@markup.link.label"] = { link = "String" }
  hl["@markup.link.latex"] = { link = "Keyword" }
  hl["@markup.environment.latex"] = { link = "markdownCodeBlock" }
  hl["@module.latex"] = { link = "Function" }
  hl["@punctuation.special.latex"] = { link = "Function" }

  for level = 1, 4 do
    hl["@markup.heading." .. level .. ".latex"] = { link = "String" }
  end

  -- Markdown
  hl["@conceal.markdown_inline"] = { link = "Operator" }
  hl["@markup.link.markdown_inline"] = { fg = "fg" }
  hl["@markup.list.checked.markdown"] = { link = "DiagnosticOk" }
  hl["@markup.list.unchecked.markdown"] = { link = "DiagnosticError" }
  hl["@markup.quote.markdown"] = { link = "markdownBlockquote" }
  hl["@markup.raw.markdown_inline"] = { fg = c.keyword, bg = c.normal_embed_bg }
  hl["@punctuation.special.markdown"] = { link = "@markup.quote.markdown" }

  for level = 1, 6 do
    local heading = "@markup.heading." .. level .. ".markdown"
    hl[heading] = { fg = c.important }
  end

  -- Comment keywords
  for comment_type, color in pairs({
    error = { bg = c.error, fg = c.normal_fg },
    danger = { bg = c.error, fg = c.normal_fg },
    warning = { bg = c.warn, fg = c.normal_bg },
    todo = { bg = c.keyword, fg = c.normal_bg },
    note = { bg = c.normal_fg, fg = c.normal_bg },
  }) do
    hl["@comment." .. comment_type] = color
    hl["@comment." .. comment_type .. ".comment"] = color
  end

  -- ************** LSP **************
  -- Diagnostics
  for type, color in pairs({
    Error = c.error,
    Warn = c.warn,
    Info = c.info,
    Hint = c.float_fg,
    Ok = c.raw_string,
  }) do
    hl["Diagnostic" .. type] = { fg = color }
    hl["DiagnosticSign" .. type] = { fg = color }
    hl["DiagnosticVirtualText" .. type] = { fg = color }
    hl["DiagnosticUnderline" .. type] =
      { sp = tint(color, -15), undercurl = true }
  end
  hl["DiagnosticUnnecessary"] = { fg = hl["Comment"]["fg"], undercurl = true }

  hl["LspCodeLens"] = { fg = c.nontext_fg }
  hl["LspSignatureActiveParameter"] = { sp = c.normal_fg, underline = true }
  hl["LspReferenceTarget"] = { link = "Substitute" }

  -- ************** PLUGINS **************
  -- Aerial
  hl["AerialLine"] = { bg = c.float_bg_select }
  hl["AerialNormal"] = { link = "" }

  -- Blink
  hl["BlinkCmpDoc"] = { link = "Pmenu" }
  hl["BlinkCmpDocBorder"] = { fg = c.float_bg_border, bg = c.float_bg }
  hl["BlinkCmpDocSeparator"] = { fg = c.float_bg_border }
  hl["BlinkCmpGhostText"] = { link = "NonText" }
  hl["BlinkCmpKind"] = { fg = c.important }
  hl["BlinkCmpLabel"] = { fg = c.float_fg }
  hl["BlinkCmpLabelDescription"] = { fg = c.nontext_fg }
  hl["BlinkCmpLabelDetail"] = { link = "NonText" }
  hl["BlinkCmpLabelMatch"] = { link = "PmenuMatch" }
  hl["BlinkCmpMenuBorder"] =
    { fg = hl["FloatBorder"]["fg"], bg = hl["Pmenu"]["bg"] }
  hl["BlinkCmpMenuSelection"] = { link = "PmenuMatchSel" }

  -- Edgy
  hl["EdgyNormal"] = { fg = c.comment_fg, bg = c.panel_bg }
  hl["EdgyIcon"] = { fg = c.comment_fg, bg = c.panel_bg }
  hl["EdgyIconActive"] = { link = "EdgyIcon" }
  hl["EdgyWinBar"] =
    { bg = c.panel_bg, underline = true, sp = c.normal_embed_bg }
  hl["EdgyTitle"] = { bg = c.panel_bg }

  -- Gitsigns
  hl["GitSignsAdd"] = { fg = c.git_add_col }
  hl["GitSignsChange"] = { fg = c.git_change_col }
  hl["GitSignsDelete"] = { fg = c.git_delete_col }
  hl["GitSignsChangedelete"] = { link = "GitSignsChange" }
  hl["GitSignsTopdelete"] = { link = "GitSignsDelete" }
  hl["GitSignsUntracked"] = { link = "NonText" }
  hl["GitSignsStagedAdd"] = { fg = tint(c.git_add_col, -50) }
  hl["GitSignsStagedChange"] = { fg = tint(c.git_change_col, -50) }
  hl["GitSignsStagedDelete"] = { fg = tint(c.git_delete_col, -50) }
  hl["GitSignsStagedChangedelete"] = { link = "GitSignsStagedChange" }
  hl["GitSignsStagedTopdelete"] = { link = "GitSignsStagedDelete" }
  hl["GitSignsStagedUntracked"] = { link = "GitSignsStagedAdd" }
  hl["GitSignsCurrentLineBlame"] = { link = "NonText" }
  hl["GitSignsAddInline"] = { link = "Added" }
  hl["GitSignsAddLnInline"] = { fg = "fg", bg = tint(c.git_add_bg, 75) }
  hl["GitSignsDeleteInline"] = { link = "Removed" }
  hl["GitSignsDeleteLnInline"] = { fg = "fg", bg = tint(c.git_delete_bg, 75) }
  hl["GitSignsChangeInline"] = { link = "DiffText" }
  hl["GitSignsChangeLnInline"] = { link = "Changed" }
  hl["GitSignsDeleteVirtLn"] = { link = "Removed" }
  hl["GitSignsDeleteVirtLnInLine"] = { link = "Removed" }
  hl["GitSignsVirtLnum"] = { link = "LineNr" }

  -- hl_match_area
  hl["MatchArea"] = { link = "MatchParen" }

  -- Lazy.nvim
  hl["LazyButton"] = { bg = c.float_bg_select }
  hl["LazyH2"] = { link = "FloatTitle" }
  hl["LazyButtonActive"] = { link = "Search" }
  hl["LazyCommit"] = { link = "" }
  hl["LazyCommitType"] = { link = "@markup.heading.gitcommit" }
  hl["LazyCommitIssue"] = { link = "Number" }
  hl["LazyProgressDone"] = { link = "LazyComment" }
  hl["LazyProgressTodo"] = { link = "FloatBorder" }
  hl["LazyReasonCmd"] = { link = "Comment" }
  hl["LazyReasonColorscheme"] = { link = "Comment" }
  hl["LazyReasonEvent"] = { link = "Comment" }
  hl["LazyReasonFt"] = { link = "Comment" }
  hl["LazyReasonPlugin"] = { link = "Comment" }
  hl["LazyReasonRequire"] = { link = "Comment" }
  hl["LazyReasonSource"] = { link = "Comment" }
  hl["LazyReasonStart"] = { link = "Comment" }
  hl["LazySpecial"] = { link = "Comment" }

  -- Mason
  hl["MasonBackdrop"] = { link = "NormalFloat" }
  hl["MasonError"] = { link = "DiagnosticError" }
  hl["MasonHeader"] = { link = "FloatTitle" }
  hl["MasonHeaderSecondary"] = { link = "Search" }
  hl["MasonHeading"] = { link = "FloatTitle" }
  hl["MasonHighlight"] = { fg = c.comment_fg }
  hl["MasonHighlightBlock"] = { bg = c.normal_embed_bg }
  hl["MasonHighlightBlockBold"] = { link = "Search" }
  hl["MasonHighlightBlockBoldSecondary"] = {}
  hl["MasonHighlightBlockSecondary"] = {}
  hl["MasonHighlightSecondary"] = { link = "Search" }
  hl["MasonLink"] = { fg = c.keyword }
  hl["MasonMuted"] = { link = "Comment" }
  hl["MasonMutedBlock"] = { bg = c.normal_embed_bg }
  hl["MasonMutedBlockBold"] = { link = "Comment" }
  hl["MasonNormal"] = { link = "NormalFloat" }
  hl["MasonWarning"] = { link = "DiagnosticWarn" }

  -- MiniCursorword
  hl["MiniCursorwordCurrent"] = {}
  hl["MiniCursorword"] = { link = "IlluminatedWordText" }

  -- nvim-cmp
  hl["CmpItemAbbrDeprecated"] = { strikethrough = true }
  hl["CmpItemAbbrMatch"] = { link = "PmenuMatch" }
  hl["CmpItemKind"] = { link = "Keyword" }

  -- vim-highlighturl
  hl["HighlightUrl"] = { link = "@text.uri" }

  -- vim-illuminate
  hl["IlluminatedWordText"] = { link = "MatchParen" }
  hl["IlluminatedWordRead"] = { link = "IlluminatedWordText" }
  hl["IlluminatedWordWrite"] = { link = "IlluminatedWordText" }

  -- visual-whitespace
  hl["VisualNonText"] = { fg = c.v_select_nontext, bg = c.v_select }

  -- render-markdown
  hl["RenderMarkdownH1Bg"] = { bg = c.v_select }

  -- Semantic Tokens
  for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
  end

  return hl
end
