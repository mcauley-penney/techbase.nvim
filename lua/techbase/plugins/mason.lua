return function(c, hl)
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
end
