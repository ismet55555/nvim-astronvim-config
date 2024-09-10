-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        colorcolumn = { 100 }, -- Add visible column barrier
        foldenable = true, -- Enable code folding
        foldlevel = 99, -- Ensure all folds are open
        ruler = true, -- Show line and column number of the cursor on right side of statusline
        timeoutlen = 400, -- Length of time to wait for a mapped sequence
        visualbell = true, -- Blink cursor on error instead of beeping
        ttyfast = true, -- Fast scrolling
        list = false, -- Show whitespace characters
        showbreak = "﬌ ", -- Show break character
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        copilot_no_tab_map = true,
        copilot_assume_mapped = true,
        copilot_tab_fallback = "",
        -- autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- C - control
      -- S - shift
      -- A - alt
      -- M - meta (mac: cmd, win: win, linux: super)
      -- CR or cr - Return/Enter
      -- first key is the mode
      i = {
        -- INSERT
        ["<A-cr>"] = {
          "copilot#Accept(<Tab>)",
          silent = true,
          expr = true,
          script = true,
          desc = "Coplilot accept suggestion",
        },
        -- ["<A-n"] = { "copilot#CycleNext(<Tab>)", silent = true, expr = true, script = true, desc = "Coplilot next suggestion"},
      },
      n = {
        -- NORMAL
        -- second key is the lefthand side of the map
        -- Move text up and down
        ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", desc = "Move single line up" },
        ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", desc = "Move single line down" },

        -- Select all in current file
        ["<leader>a"] = { "ggVG", desc = "Select all text in file" },

        -- Enter blank line without leaving NORMAL mode
        ["<CR>"] = { "o<Esc>", desc = "Return down in normal mode" },

        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
        ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
        ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

        -- Diffview for Git
        ["<leader>go"] = { "<cmd>DiffviewOpen<CR>", desc = "Git DiffView open" },
        ["<leader>gx"] = { "<cmd>DiffviewClose<CR>", desc = "Git DiffView close" },

        -- Cheat.sh
        ["<leader>ch"] = { "<cmd>Cheat<CR>", desc = "Open Cheat.sh input" },

        -- Copilot Panel
        ["<leader>cc"] = { "<cmd>Copilot panel<CR>", desc = "Copilot suggestion panel" },

        -- hop.nvim
        -- ["s"] = { "<cmd>HopChar1<CR>", desc = "Hop to specific character" },

        -- Spectre - Search and Replace
        ["<leader>rg"] = { "<cmd>lua require('spectre').open()<CR>", desc = "Search/Replace in Workspace" },
        ["<leader>rf"] = { "<cmd>lua require('spectre').open_file_search()<CR>", desc = "Search/Replace in File" },

        -- Rename
        ["<leader>rn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Search/Replace in LSP Workspace" },

        -- navigate buffer tabs with `H` and `L`
        L = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        H = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },

        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      v = {
        -- VISUAL
      },
      x = {
        -- VISUAL BLOCK
        ["<A-j>"] = { ":move '>+1<CR>gv-gv", desc = "Move lines down" },
        ["<A-k>"] = { ":move '<-2<CR>gv-gv", desc = "Move lines up" },
      },
      t = {
        -- TERMINAL
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      c = {
        -- COMMAND
      },
    },
  },
}
