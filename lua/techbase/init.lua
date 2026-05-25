local M = {}

local defaults = {
  italic_comments = false,
  transparent = false,
  hl_overrides = {},
}

M.opts = vim.deepcopy(defaults)

function M.setup(opts)
  opts = opts or {}
  M.opts = vim.tbl_deep_extend("force", {}, defaults, opts)
end

function M.load(theme)
  local ok
  ok, theme = pcall(require, "techbase.palettes." .. theme)
  theme = ok and theme or require("techbase.palettes.techbase")

  local c = vim.deepcopy(theme)
  local group_fn = require("techbase.highlights")
  local groups = group_fn(c)

  groups["Comment"].italic = M.opts.italic_comments

  if M.opts.transparent then
    for _, g in ipairs({
      "FoldColumn",
      "Normal",
      "NormalNC",
      "NormalFloat",
      "SignColumn",
      "StatusLine",
      "TabLine",
      "TabLineFill",
    }) do
      if groups[g] then groups[g].bg = "NONE" end
    end
  end

  local overrides = M.opts.hl_overrides
  local extra = type(overrides) == "function"
      and overrides(vim.deepcopy(groups))
    or overrides

  if extra and next(extra) then
    groups = vim.tbl_deep_extend("force", groups, extra)
  end

  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

return M
