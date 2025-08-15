return function(c, hl)
  local colors = require("techbase.palettes.techbase")

  hl["AerialLine"] = { bg = c.float_bg_select }
  hl["AerialNormal"] = { link = "" }

  hl.normal = {
    a = { fg = colors.normal_bg, bg = colors.important },
    b = { fg = colors.normal_fg, bg = colors.normal_bg_alt },
    c = { fg = colors.normal_fg, bg = colors.normal_bg },
  }

  hl.insert = {
    a = { fg = colors.normal_bg, bg = colors.string },
  }

  hl.command = {
    a = { fg = colors.normal_bg, bg = colors.search },
  }

  hl.visual = {
    a = { fg = colors.normal_bg, bg = colors.constant },
  }

  hl.replace = {
    a = { fg = colors.normal_bg, bg = colors.number },
  }

  hl.inactive = {
    a = { fg = colors.comment_fg, bg = colors.panel_bg },
    b = { fg = colors.comment_fg, bg = colors.panel_bg },
    c = { fg = colors.comment_fg, bg = colors.normal_bg },
  }
end
