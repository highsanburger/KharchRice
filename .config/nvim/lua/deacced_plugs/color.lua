return {
  "ziontee113/color-picker.nvim",
  dependencies = { "norcalli/nvim-colorizer.lua", },
  config = function()
    require("color-picker").setup({
      ["icons"] = { "-", "|" },
      ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
    })
    require 'colorizer'.setup {
      '*',                       -- Highlight all files, but customize some others.
      css = { rgb_fn = true, },  -- Enable parsing rgb(...) functions in css.
      html = { rgb_fn = true, }, -- Enable parsing rgb(...) functions in css.
    }
  end,
}
