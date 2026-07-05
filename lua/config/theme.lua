local M = {}

----------------------------------------------------------
-- Theme
----------------------------------------------------------

M.name = "catppuccin"

----------------------------------------------------------
-- Flavour (UI)
----------------------------------------------------------

M.flavour = "macchiato"

----------------------------------------------------------
-- Syntax Palette
----------------------------------------------------------

M.syntax = "mocha"

----------------------------------------------------------
-- Helpers
----------------------------------------------------------

function M.palette(flavour)
  return require("catppuccin.palettes").get_palette(flavour or M.flavour)
end

function M.syntax_palette()
  return require("catppuccin.palettes").get_palette(M.syntax)
end

return M
