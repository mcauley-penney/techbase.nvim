local source = debug.getinfo(1, "S").source
local script_path = source:sub(1, 1) == "@" and source:sub(2) or arg[0]
local script_dir = script_path:match("^(.*)[/\\][^/\\]+$") or "."
local root_dir = script_dir .. "/.."

package.path = table.concat({
  root_dir .. "/lua/?.lua",
  root_dir .. "/lua/?/init.lua",
  package.path,
}, ";")

local variants = require("techbase.variants")

local out_dir = script_dir .. "/zsh"
local palette_var = "TECHBASE_COLORS"

local function shell_quote(value)
  return "'" .. value:gsub("'", "'\"'\"'") .. "'"
end

local function sorted_palette_keys(palette)
  local keys = {}

  for name, color in pairs(palette) do
    assert(type(name) == "string", "palette keys must be strings")
    assert(
      type(color) == "string",
      ("palette color %q must be a string"):format(name)
    )

    keys[#keys + 1] = name
  end

  table.sort(keys)
  return keys
end

local function write_file(path, body)
  local file = assert(io.open(path, "w"))
  file:write(body)
  file:close()
end

assert(os.execute(('mkdir -p "%s"'):format(out_dir)))

for _, variant in ipairs(variants.variants) do
  local colors = variants.palette(variant.name)
  local lines = {
    "# Generated from the Techbase palette; do not edit by hand.",
    ("typeset -gA %s=("):format(palette_var),
  }

  for _, name in ipairs(sorted_palette_keys(colors)) do
    lines[#lines + 1] = ("  [%s]=%s"):format(
      shell_quote(name),
      shell_quote(colors[name])
    )
  end

  lines[#lines + 1] = ")"
  lines[#lines + 1] = ""

  local path = ("%s/%s.zsh"):format(out_dir, variant.name)
  write_file(path, table.concat(lines, "\n"))
  print("wrote " .. path)
end
