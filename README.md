<img width="1600" height="800" alt="techbase_titlecard" src="https://github.com/user-attachments/assets/3efa3036-3556-42e0-805c-fdcbd3120b1c" />

<p align="center">
<sub><i>You have entered deeply into the infested starport. But something is wrong.</i></sub>
</p>

A colorscheme inspired by

- The aesthetics of [Doom (1993)](<https://en.wikipedia.org/wiki/Doom_(1993_video_game)>) and [Doom 2 (1994)](https://en.wikipedia.org/wiki/Doom_II),
- 1990's technology and conceptions of future technologies, and
- sci-fi, sci-fi horror, and cosmic horror.

## Screenshots

<details>
<summary>Markdown</summary>

<img width="2370" height="1673" alt="techbase-markdown" src="https://github.com/user-attachments/assets/98cfec31-039b-4916-a661-8cd5ca451601" />

</details>

<details>
<summary>React</summary>

<img width="2242" height="1690" alt="techbase-react" src="https://github.com/user-attachments/assets/cd31475d-8719-4f48-8e24-8b8dc7cba51e" />

</details>

## Themes

### Techbase

- The original: dark and cold
- Named after an aesthetic of Doom maps called ["Techbase"](https://doomwiki.org/wiki/Techbase_map).

### Hellbound

- Darkest
- Named after the first megawad I ever played and one of my favorites, [Hellbound by Zoltán Sófalvi](https://doomwiki.org/wiki/Hellbound).

### Escape Velocity

- high contrast variant of Hellbound
- Compliant with WCAG AAA
- Named after ["Escape Velocity" by James Paddock](https://www.youtube.com/watch?v=InjLUK0Ipnk&list=RDInjLUK0Ipnk), the track for Map13 of Doom 2 Megawad [Back to Saturn X](https://doomwiki.org/wiki/Back_to_Saturn_X) and my personal favorite Doom track.

## Installation

To use the color scheme with default options with Lazy.nvim:

```lua
{
    "mcauley-penney/techbase.nvim",
    config = function(_, opts)
        vim.cmd.colorscheme("techbase")
    end,
    priority = 1000
}
```

## Configuration

A template for using the plugin with non-default options:

```lua
{
    "mcauley-penney/techbase.nvim",
    opts = {
      italic_comments = false,

      -- set to true to make the background, floating windows, statusline,
      -- signcolumn, foldcolumn, and tabline transparent
      transparent = false,

      -- Here, you can disable plugins. All plugins that techbase supports
      -- are enabled by default. You do not need to specify the ones you
      -- want to enable, only those you wish to disable. This table
      -- accepts key-pair values.
      plugin_support = {
        visual_whitespace = false,
      },

      -- You can enable *only* some plugins by using the "only" table
      -- inside of the "plugin_support" table. This table accepts strings.
      -- plugin_support = {
      --   only = { "visual_whitespace" }
      -- },

      -- allows you to override any highlight group for finer-grained control
      hl_overrides = {},
    },
    init = function() vim.cmd.colorscheme("techbase") end,
    priority = 1000
}
```

> [!IMPORTANT]
> To load the color scheme by default and use non-default options, you should load the options, then the scheme. This is how the template above is set up.

### Plugin Support

All plugins that techbase supports are enabled by default. You do not need to specify the ones you want to enable, only those you wish to disable. See [here](https://github.com/mcauley-penney/techbase.nvim/tree/main/lua/techbase/plugins) for a list of plugins that Techbase supports.

Some plugins need extra configuration to work. These include:

<details>
  <summary>Lualine</summary>

### Lualine

```lua
 require('lualine').setup {
  options = {
    theme = "techbase"
    -- ... your lualine config
  }
}
```

</details>

## Extras

Matching color schemes are available for external tools:

- Ghostty
- iTerm2
- Kitty
- Tmux
- Warp
- Wezterm

Please see those tools' respective documentation for how to use these configurations.
