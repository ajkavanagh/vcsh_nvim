local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

-- now also configure the treesitter-textobjects
local to_status_ok, _ = pcall(require, "nvim-treesitter-textobjects")

-- configure core treesitter
local treesitter_config = {
  ensure_installed = "", -- one of "all", or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = {
      "yaml",
      "python",
      "rust"
    }
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
}

if to_status_ok then
  local textobjects_config = {
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
          ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
          ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
          ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

          ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
          ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

          ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
          ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

          ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
          ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

          ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
          ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

          ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
          ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

          ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]f"] = { query = "@call.outer", desc = "Next function call start" },
          ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
          ["]c"] = { query = "@class.outer", desc = "Next class start" },
          ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
          ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

          -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
          -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
          ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_next_end = {
          ["]F"] = { query = "@call.outer", desc = "Next function call end" },
          ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
          ["]C"] = { query = "@class.outer", desc = "Next class end" },
          ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
          ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
        },
        goto_previous_start = {
          ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
          ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
          ["[c"] = { query = "@class.outer", desc = "Prev class start" },
          ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
          ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
        },
        goto_previous_end = {
          ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
          ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
          ["[C"] = { query = "@class.outer", desc = "Prev class end" },
          ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
          ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
        },
      },
    },
  }
  treesitter_config = vim.tbl_extend("error", treesitter_config, textobjects_config)

  -- also set up repeat if we have textobjects
  local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

  -- vim way: ; goes to the direction you were moving.
  vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
  vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

  -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
  vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
  vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
  vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
  vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
end

configs.setup(treesitter_config)
