local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  if col == 0 then
    return false
  end
  local text = vim.api.nvim_get_current_line()
  return text:sub(col, col):match("%s") == nil
end

return {

  ----------------------------------------------------------
  -- TAB (Smart SuperTab)
  ----------------------------------------------------------

  {
    "<Tab>",
    function()
      local blink = package.loaded["blink.cmp"]

      if blink and blink.is_visible() then
        return blink.select_next()
      end

      if has_words_before() then
        return require("luasnip").expand_or_jump()
      end

      return "<Tab>"
    end,
    expr = true,
    mode = "i",
  },

  {
    "<S-Tab>",
    function()
      local blink = package.loaded["blink.cmp"]

      if blink and blink.is_visible() then
        return blink.select_prev()
      end

      return "<S-Tab>"
    end,
    expr = true,
    mode = "i",
  },

  {

    ----------------------------------------------------------
    -- AI (explicit only)
    ----------------------------------------------------------

    {
      "<A-y>",
      function()
        require("minuet").make_blink_map()()
      end,
      mode = "i",
    },
  },
}
