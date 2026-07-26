local M = {
  default = "techbase",
  variants = {
    {
      name = "techbase",
      groups_path = "techbase.dark_hl_groups",
    },
    {
      name = "hellbound",
      groups_path = "techbase.dark_hl_groups",
    },
    {
      name = "escape_velocity",
      groups_path = "techbase.dark_hl_groups",
    },
    {
      name = "entryway",
      groups_path = "techbase.dark_hl_groups",
    },
    {
      name = "sw1comm",
      groups_path = "techbase.light_hl_groups",
    },
  },
}

local variants_by_name = {}

for _, variant in ipairs(M.variants) do
  variant.palette_path = "techbase.palettes." .. variant.name
  variants_by_name[variant.name] = variant
end

function M.find(name) return variants_by_name[name] end

function M.get(name)
  local variant = M.find(name)

  if not variant then
    error(("unknown Techbase variant %q"):format(tostring(name)), 2)
  end

  return variant
end

function M.palette(name) return require(M.get(name).palette_path) end

return M
