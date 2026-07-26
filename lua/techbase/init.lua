local M = {}
local variants = require("techbase.variants")

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

function M.load(name)
  local scheme_variant = variants.get(name)
  local color_palette = vim.deepcopy(require(scheme_variant.palette_path))

  local hl_group_fn = require(scheme_variant.groups_path)
  local hl_groups = hl_group_fn(color_palette)

  hl_groups["Comment"].italic = M.opts.italic_comments

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
      if hl_groups[g] then hl_groups[g].bg = "NONE" end
    end
  end

  local overrides = M.opts.hl_overrides
  local extra = type(overrides) == "function"
      and overrides(vim.deepcopy(hl_groups))
    or overrides

  if extra and next(extra) then
    hl_groups = vim.tbl_deep_extend("force", hl_groups, extra)
  end

  vim.cmd("highlight clear")

  if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

  vim.g.colors_name = name

  for group, spec in pairs(hl_groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

return M
