-- Customize Treesitter

require("nvim-treesitter.install").command_extra_args = {
  curl = { "-k" },
}

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.automatic_installation = true
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "bash",
      "c",
      "dockerfile",
      "gitignore",
      "go",
      "javascript",
      "json",
      "lua",
      "markdown",
      "python",
      "query",
      "rust",
      "toml",
      "vim",
      "yaml",
      -- add more arguments for adding more treesitter parsers
    })
  end,
}
