<img width="1600" height="800" alt="techbase_titlecard" src="https://github.com/user-attachments/assets/3efa3036-3556-42e0-805c-fdcbd3120b1c" />

<p align="center">
<sub><i>You have entered deeply into the infested starport. But something is wrong.</i></sub>
</p>

A colorscheme inspired by

- The aesthetics of [Doom (1993)](<https://en.wikipedia.org/wiki/Doom_(1993_video_game)>) and [Doom 2 (1994)](https://en.wikipedia.org/wiki/Doom_II),
- 1990's technology and conceptions of future technologies, and
- sci-fi, sci-fi horror, and cosmic horror.

## Variants

### Techbase

- dark and cold
- Named after an aesthetic of Doom maps called ["Techbase"](https://doomwiki.org/wiki/Techbase_map).

<details>
<summary>Markdown</summary>

<img width="2370" height="1673" alt="techbase-markdown" src="https://github.com/user-attachments/assets/98cfec31-039b-4916-a661-8cd5ca451601" />

</details>

<details>
<summary>React</summary>

<img width="2242" height="1690" alt="techbase-react" src="https://github.com/user-attachments/assets/cd31475d-8719-4f48-8e24-8b8dc7cba51e" />

</details>

### Hellbound

- Darkest
- Named after the first megawad I ever played and one of my favorites, [Hellbound by Zoltán Sófalvi](https://doomwiki.org/wiki/Hellbound).

### Escape Velocity

- high contrast variant of Hellbound
- Compliant with WCAG AAA
- Named after ["Escape Velocity" by James Paddock](https://www.youtube.com/watch?v=InjLUK0Ipnk&list=RDInjLUK0Ipnk), the track for Map13 of Doom 2 Megawad [Back to Saturn X](https://doomwiki.org/wiki/Back_to_Saturn_X) and my personal favorite Doom track.

## Installation

Below are examples for installing and loading the color scheme. Call `setup()` before `colorscheme` when using non-default options.

vim.pack:

```lua
vim.pack.add({
  { src = "https://github.com/mcauley-penney/techbase.nvim" },
})

-- optional: configure before loading the colorscheme
require("techbase").setup({
  italic_comments = false,
  transparent = false,
  hl_overrides = {},
})

vim.cmd.colorscheme("techbase")
```

Lazy.nvim:

```lua
{
    "mcauley-penney/techbase.nvim",
    opts = {
      italic_comments = false,

      -- set to true to make the background, floating windows, statusline,
      -- signcolumn, foldcolumn, and tabline transparent
      transparent = false,

      -- allows you to override any highlight group for finer-grained control
      hl_overrides = {},
    },
    init = function() vim.cmd.colorscheme("techbase") end,
    priority = 1000
}
```

> [!IMPORTANT]
> To load the color scheme by default and use non-default options, you should load the options, then the scheme. This is how the template above is set up.

## Plugins

### Highlights

To override plugin highlights, use `hl_overrides` with the plugin highlight group name:

```lua
opts = {
  hl_overrides = {
    GitSignsAdd = { link = "Added" },
    VisualNonText = { fg = "#ff0000" },
  },
}
```

### Lualine

Lualine uses a separate theme file and needs to be configured in lualine:

```lua
 require('lualine').setup {
  options = {
    theme = "techbase"
    -- ... your lualine config
  }
}
```

## Extras

Matching color schemes are available for external tools:

- Ghostty
- iTerm2
- Kitty
- Tmux
- Warp
- Wezterm

Please see those tools' respective documentation for how to use these configurations.
