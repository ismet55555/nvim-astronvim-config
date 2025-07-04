-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "██      ███████ ████████ ███████      ██████   ██████  ██ ",
        "██      ██         ██    ██          ██       ██    ██ ██ ",
        "██      █████      ██    ███████     ██   ███ ██    ██ ██ ",
        "██      ██         ██         ██     ██    ██ ██    ██    ",
        "███████ ███████    ██    ███████      ██████   ██████  ██ ",
      }
      return opts
    end,
  },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   lazy = true,
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   opts = {
  --     suggestion = {
  --       enabled = true,
  --       auto_trigger = true,
  --       debounce = 150,
  --     },
  --   },
  -- },

  -- Distraction free writing (Zen Mode)
  {
    "folke/zen-mode.nvim",
    config = function() require("zen-mode").setup {} end,
  },

  -- Git Diff viewer
  {
    "sindrets/diffview.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    after = "plenary.nvim",
    -- event = "Uer AstroritFile",
    lazy = false,
  },

  -- Cheat.sh Code Snippets and Answers (Open with :Cheat)
  { "RishabhRD/popfix" },
  {
    "RishabhRD/nvim-cheat.sh",
    lazy = false,
  },

  -- Keyboard shortcuts for common VIM operations
  { "tpope/vim-unimpaired" },

  -- Find and replace locally or globally
  { "windwp/nvim-spectre" },

  -- Smart code folding
  { "pseewald/vim-anyfold" },

  --- MDX syntax highlighting
  {
    "davidmh/mdx.nvim",
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- Rust tools for rust language
  -- { "simrat39/rust-tools.nvim" },
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = true },

  -- -- Move to specific position on screen fast
  -- ["phaazon/hop.nvim"] = {
  --   branch = "v2",
  --   config = function() require("hop").setup { keys = "etovxqpdygfblzhckisuran" } end,
  -- },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    "karb94/neoscroll.nvim",
    opts = {},
  },
}
