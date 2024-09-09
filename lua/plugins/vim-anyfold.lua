return {
  {
    "pseewald/vim-anyfold",
    event = "BufRead", -- This ensures the plugin is loaded when a buffer is read
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        command = "AnyFoldActivate",
        group = vim.api.nvim_create_augroup("anyfold", { clear = true }),
      })
    end,
  },
}
