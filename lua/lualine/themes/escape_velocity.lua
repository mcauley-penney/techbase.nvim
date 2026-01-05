local c = require("techbase.palettes.escape_velocity")

return {
  normal = {
    a = { fg = c.normal_bg, bg = c.important, gui = "bold" },
    b = {
      fg = c.normal_fg,
      bg = c.normal_bg_alt,
    },
    c = { fg = c.normal_fg, bg = c.normal_bg },
  },
  insert = {
    a = { fg = c.normal_bg, bg = c.string, gui = "bold" },
  },
  visual = {
    a = { fg = c.normal_bg, bg = c.constant, gui = "bold" },
  },
  replace = {
    a = { fg = c.normal_bg, bg = c.number, gui = "bold" },
  },
  command = {
    a = { fg = c.normal_bg, bg = c.search, gui = "bold" },
  },
  inactive = {
    a = { fg = c.comment_fg, bg = c.panel_bg },
    b = { fg = c.comment_fg, bg = c.panel_bg },
    c = { fg = c.comment_fg, bg = c.normal_bg },
  },
}
