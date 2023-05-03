# Prerequisites

Neovim 0.8.0+

# Installing

Using `packer`

```lua
use { "nxstynate/rosePine.nvim" }
```

Using `lazy.nvim`

```lua
{ "nxstynate/rosePine.nvim", priority = 1000 }
```

# Basic Usage

Inside `init.vim`

```vim
set background=dark " or light if you want light mode
colorscheme rosePine
```

Inside `init.lua`

```lua
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme rosePine]])
```

# Configuration

Additional settings for rosePine are:

```lua
-- setup must be called before loading the colorscheme
-- Default options:
require("rosePine").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme rosePine")
```

## Overriding

### Palette

You can specify your own palette colors. For example:

```lua
require("rosePine").setup({
    palette_overrides = {
        bright_green = "#990000",
    }
})
vim.cmd("colorscheme rosePine")
```

More colors in the [palette.lua](lua/rosePine/palette.lua) file

### Highlight groups

If you don't enjoy the current color for a specific highlight group, now you can just override it in the setup. For
example:

```lua
require("rosePine").setup({
    overrides = {
        SignColumn = {bg = "#ff9900"}
    }
})
vim.cmd("colorscheme rosePine")
```

Please note that the override values must follow the attributes from the highlight group map, such as:

- **fg** - foreground color
- **bg** - background color
- **bold** - true or false for bold font
- **italic** - true or false for italic font

Other values can be seen in `:h synIDattr`
