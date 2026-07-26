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

local out_dir = script_dir .. "/dircolors"

local terminals = {
  "alacritty",
  "alacritty-direct",
  "ansi",
  "*color*",
  "con[0-9]*x[0-9]*",
  "cons25",
  "console",
  "cygwin",
  "dtterm",
  "dvtm",
  "dvtm-256color",
  "Eterm",
  "eterm-color",
  "fbterm",
  "gnome",
  "gnome-256color",
  "hurd",
  "jfbterm",
  "konsole",
  "konsole-256color",
  "kterm",
  "linux",
  "linux-c",
  "mlterm",
  "putty",
  "putty-256color",
  "rxvt*",
  "rxvt-unicode",
  "rxvt-256color",
  "rxvt-unicode256",
  "screen*",
  "screen-256color",
  "st",
  "st-256color",
  "terminator",
  "tmux*",
  "tmux-256color",
  "vt100",
  "wezterm",
  "xterm*",
  "xterm-color",
  "xterm-88color",
  "xterm-256color",
  "xterm-kitty",
}

local extension_sections = {
  {
    name = "Archives",
    color = "warn",
    patterns = {
      ".7z",
      ".ace",
      ".alz",
      ".arc",
      ".arj",
      ".bz",
      ".bz2",
      ".cab",
      ".cpio",
      ".deb",
      ".dz",
      ".ear",
      ".gz",
      ".jar",
      ".lha",
      ".lrz",
      ".lz",
      ".lz4",
      ".lzh",
      ".lzma",
      ".lzo",
      ".rar",
      ".rpm",
      ".rz",
      ".sar",
      ".t7z",
      ".tar",
      ".taz",
      ".tbz",
      ".tbz2",
      ".tgz",
      ".tlz",
      ".txz",
      ".tz",
      ".tzo",
      ".tzst",
      ".war",
      ".xz",
      ".z",
      ".Z",
      ".zip",
      ".zoo",
      ".zst",
    },
  },
  {
    name = "Executables",
    color = "error",
    patterns = {
      ".app",
      ".bat",
      ".btm",
      ".cmd",
      ".com",
      ".exe",
      ".reg",
    },
  },
  {
    name = "Ignored files",
    color = "comment_fg",
    patterns = {
      "*~",
      ".bak",
      ".BAK",
      ".gitignore",
      ".gitmodules",
      ".lock",
      ".log",
      ".old",
      ".OLD",
      ".orig",
      ".ORIG",
      ".swo",
      ".swp",
    },
  },
  {
    name = "Images",
    color = "constant",
    patterns = {
      ".bmp",
      ".cgm",
      ".dl",
      ".dvi",
      ".emf",
      ".eps",
      ".gif",
      ".jpeg",
      ".jpg",
      ".JPG",
      ".mng",
      ".pbm",
      ".pcx",
      ".pgm",
      ".png",
      ".PNG",
      ".ppm",
      ".pps",
      ".ppsx",
      ".ps",
      ".svg",
      ".svgz",
      ".tga",
      ".tif",
      ".tiff",
      ".webp",
      ".xbm",
      ".xcf",
      ".xpm",
      ".xwd",
      ".yuv",
    },
  },
  {
    name = "Video",
    color = "search",
    patterns = {
      ".anx",
      ".asf",
      ".avi",
      ".axv",
      ".flc",
      ".fli",
      ".flv",
      ".gl",
      ".m2v",
      ".m4v",
      ".mkv",
      ".mov",
      ".MOV",
      ".mp4",
      ".mpeg",
      ".mpg",
      ".nuv",
      ".ogm",
      ".ogv",
      ".ogx",
      ".qt",
      ".rm",
      ".rmvb",
      ".swf",
      ".vob",
      ".webm",
      ".wmv",
    },
  },
  {
    name = "Audio",
    color = "search",
    patterns = {
      ".aac",
      ".au",
      ".flac",
      ".m4a",
      ".mid",
      ".midi",
      ".mka",
      ".mp3",
      ".mpa",
      ".mpeg",
      ".mpg",
      ".ogg",
      ".opus",
      ".ra",
      ".wav",
    },
  },
  {
    name = "Documents",
    color = "raw_string",
    patterns = {
      ".doc",
      ".docx",
      ".dot",
      ".odg",
      ".odp",
      ".ods",
      ".odt",
      ".otg",
      ".otp",
      ".ots",
      ".ott",
      ".pdf",
      ".ppt",
      ".pptx",
      ".xls",
      ".xlsx",
    },
  },
}

local function rgb(hex)
  assert(
    type(hex) == "string" and hex:match("^#%x%x%x%x%x%x$"),
    ("invalid palette color %q"):format(tostring(hex))
  )

  return tonumber(hex:sub(2, 3), 16),
    tonumber(hex:sub(4, 5), 16),
    tonumber(hex:sub(6, 7), 16)
end

local function fg(hex)
  local r, g, b = rgb(hex)
  return ("38;2;%d;%d;%d"):format(r, g, b)
end

local function bg(hex)
  local r, g, b = rgb(hex)
  return ("48;2;%d;%d;%d"):format(r, g, b)
end

local function add_entry(lines, name, value)
  lines[#lines + 1] = ("%-22s %s"):format(name, value)
end

local function add_heading(lines, title)
  lines[#lines + 1] = "#+--------------------+"
  lines[#lines + 1] = ("#+ %-18s +"):format(title)
  lines[#lines + 1] = "#+--------------------+"
end

local function build_dircolors(colors)
  local lines = {
    "# Generated from the Techbase palette; do not edit by hand.",
    "#",
    "# Format reference:",
    "# https://man7.org/linux/man-pages/man5/dir_colors.5.html",
    "",
    "COLOR tty",
    "",
    "# Terminal definitions",
  }

  for _, terminal in ipairs(terminals) do
    lines[#lines + 1] = "TERM " .. terminal
  end

  lines[#lines + 1] = ""
  add_heading(lines, "Global defaults")
  add_entry(lines, "NORMAL", "00")
  add_entry(lines, "RESET", "0")
  lines[#lines + 1] = ""

  lines[#lines + 1] = "# Regular files"
  add_entry(lines, "FILE", fg(colors.string))
  lines[#lines + 1] = ""

  lines[#lines + 1] = "# Directories"
  add_entry(lines, "DIR", fg(colors.important))
  lines[#lines + 1] = ""

  lines[#lines + 1] = "# Symbolic links"
  add_entry(lines, "LINK", fg(colors.info))
  add_entry(lines, "MULTIHARDLINK", "04;" .. fg(colors.info))
  lines[#lines + 1] = ""

  lines[#lines + 1] = "# Special files"
  add_entry(lines, "FIFO", "04;01;" .. fg(colors.info))
  add_entry(lines, "SOCK", "04;" .. fg(colors.search))
  add_entry(lines, "DOOR", "04;01;" .. fg(colors.info))
  add_entry(lines, "BLK", "01;" .. fg(colors.search))
  add_entry(lines, "CHR", fg(colors.search))
  lines[#lines + 1] = ""

  lines[#lines + 1] = "# Broken symbolic links and missing targets"
  add_entry(lines, "ORPHAN", fg(colors.error))
  add_entry(
    lines,
    "MISSING",
    "01;" .. fg(colors.normal_fg) .. ";" .. bg(colors.error)
  )
  lines[#lines + 1] = ""

  lines[#lines + 1] = "# Executable files"
  add_entry(lines, "EXEC", fg(colors.number))
  lines[#lines + 1] = ""

  lines[#lines + 1] = "# set-UID/GID files and capabilities"
  add_entry(lines, "SETUID", "01;04;" .. fg(colors.normal_fg))
  add_entry(lines, "SETGID", "01;04;" .. fg(colors.normal_fg))
  add_entry(lines, "CAPABILITY", "01;" .. fg(colors.normal_fg))
  lines[#lines + 1] = ""

  lines[#lines + 1] = "# Sticky and other-writable directories"
  add_entry(
    lines,
    "STICKY_OTHER_WRITABLE",
    "01;" .. fg(colors.normal_bg) .. ";" .. bg(colors.important)
  )
  add_entry(lines, "OTHER_WRITABLE", fg(colors.important))
  add_entry(
    lines,
    "STICKY",
    "04;" .. fg(colors.normal_fg) .. ";" .. bg(colors.important)
  )
  lines[#lines + 1] = ""

  add_heading(lines, "Extension patterns")
  lines[#lines + 1] = ""
  add_entry(lines, "*", fg(colors.string))

  for _, section in ipairs(extension_sections) do
    lines[#lines + 1] = ""
    lines[#lines + 1] = "# " .. section.name

    for _, pattern in ipairs(section.patterns) do
      add_entry(lines, pattern, fg(colors[section.color]))
    end
  end

  lines[#lines + 1] = ""
  return table.concat(lines, "\n")
end

local function write_file(path, body)
  local file = assert(io.open(path, "w"))
  file:write(body)
  file:close()
end

assert(os.execute(('mkdir -p "%s"'):format(out_dir)))

for _, variant in ipairs(variants.variants) do
  local colors = variants.palette(variant.name)
  local path = ("%s/dircolors-%s"):format(out_dir, variant.name)

  write_file(path, build_dircolors(colors))
  print("wrote " .. path)
end
