-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "ansiblels",
        "bashls",
        "docker_compose_language_service",
        "dockerls",
        "gopls",
        "jsonls",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "terraformls",
        "yamlls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "ansible-lint",
        "beautysh",
        "cspell",
        "jsonlint",
        "markdownlint",
        "mypy",
        "prettier",
        "pydocstyle",
        "pyrefly",
        "ruff",
        "shellcheck",
        "shellharden",
        "shfmt",
        "stylua",
        "tflint",
        "yamlfmt",
        "yamllint",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "python",
        "bash",
        -- add more arguments for adding more debuggers
      })
    end,
  },
}
