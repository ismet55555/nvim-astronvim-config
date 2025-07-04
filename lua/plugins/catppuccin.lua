return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      dim_inactive = { enabled = false }, -- This was causing the opacity issue!
      transparent_background = true,
      highlight_overrides = {},
    },
  },
}
