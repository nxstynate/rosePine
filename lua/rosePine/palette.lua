-- Solarized Dark
local M = {}

M.colors = {
  dark0_hard = "#16141f",
  dark0 = "#191724",
  dark0_soft = "#1f1d2e",
  dark1 = "#6e6a86",
  dark2 = "#908caa",
  dark3 = "#c4a7e7",
  dark4 = "#e0def4",
  light0_hard = "#1f1d2e",
  light0 = "#e0def4",
  light0_soft = "#e0def4",
  light1 = "#908caa",
  light2 = "#6e6a86",
  light3 = "#403d52",
  light4 = "#26233a",
  bright_red = "#eb6f92",
  bright_green = "#f6c177",
  bright_yellow = "#ebbcba",
  bright_blue = "#31748f",
  bright_purple = "#c4a7e7",
  bright_aqua = "#9ccfd8",
  bright_orange = "#eb6f92",
  neutral_red = "#eb6f92",
  neutral_green = "#f6c177",
  neutral_yellow = "#ebbcba",
  neutral_blue = "#31748f",
  neutral_purple = "#c4a7e7",
  neutral_aqua = "#9ccfd8",
  neutral_orange = "#eb6f92",
  faded_red = "#eb6f92",
  faded_green = "#f6c177",
  faded_yellow = "#ebbcba",
  faded_blue = "#31748f",
  faded_purple = "#c4a7e7",
  faded_aqua = "#9ccfd8",
  faded_orange = "#eb6f92",
  gray = "#908caa",
}

M.get_base_colors = function(bg, contrast)
  local config = require("rosePine").config
  local p = M.colors

  for color, hex in pairs(config.palette_overrides) do
    p[color] = hex
  end

  if bg == nil then
    bg = vim.o.background
  end

  local colors = {
    dark = {
      bg0 = p.dark0,
      bg1 = p.dark1,
      bg2 = p.dark2,
      bg3 = p.dark3,
      bg4 = p.dark4,
      fg0 = p.light0,
      fg1 = p.light1,
      fg2 = p.light2,
      fg3 = p.light3,
      fg4 = p.light4,
      red = p.bright_red,
      green = p.bright_green,
      yellow = p.bright_yellow,
      blue = p.bright_blue,
      purple = p.bright_purple,
      aqua = p.bright_aqua,
      orange = p.bright_orange,
      neutral_red = p.neutral_red,
      neutral_green = p.neutral_green,
      neutral_yellow = p.neutral_yellow,
      neutral_blue = p.neutral_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      gray = p.gray,
    },
    light = {
      bg0 = p.light0,
      bg1 = p.light1,
      bg2 = p.light2,
      bg3 = p.light3,
      bg4 = p.light4,
      fg0 = p.dark0,
      fg1 = p.dark1,
      fg2 = p.dark2,
      fg3 = p.dark3,
      fg4 = p.dark4,
      red = p.faded_red,
      green = p.faded_green,
      yellow = p.faded_yellow,
      blue = p.faded_blue,
      purple = p.faded_purple,
      aqua = p.faded_aqua,
      orange = p.faded_orange,
      neutral_red = p.neutral_red,
      neutral_green = p.neutral_green,
      neutral_yellow = p.neutral_yellow,
      neutral_blue = p.neutral_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      gray = p.gray,
    },
  }

  if contrast ~= nil and contrast ~= "" then
    colors[bg].bg0 = p[bg .. string.format("0_%s", contrast)]
  end

  return colors[bg]
end

return M
