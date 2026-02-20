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

  -- Semantic Tokens
  for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
  end

  return hl
end
