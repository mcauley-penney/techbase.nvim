return function(c, hl)
  hl["EdgyNormal"] = { fg = c.comment_fg, bg = c.panel_bg }
  hl["EdgyIcon"] = { fg = c.comment_fg, bg = c.panel_bg }
  hl["EdgyIconActive"] = { link = "EdgyIcon" }
  hl["EdgyWinBar"] = { bg = c.panel_bg, underline = true, sp = c.normal_embed_bg }
  hl["EdgyTitle"] = { bg = c.panel_bg }
end
