local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "isort", "black" },
    systemverilog = { "verible" },
    verilog = { "verible" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  formatters = {
    -- SystemVerilog / Verilog (.sv, .svh, .v, .vh)
    verible = {
      -- wrapper: plain verible-verilog-format exits 0 and returns the buffer
      -- unchanged on a parse error, which makes <leader>fm look like a no-op
      command = vim.fn.expand "~/.config/nvim/bin/verible-format",
      prepend_args = {
        "--indentation_spaces=2",
        "--column_limit=200", -- matches the verible LSP line-length rule
        "--wrap_spaces=4",
        -- "preserve" = keep existing alignment; use "infer"/"align" to let
        -- verible reflow columns in legacy UVM code
        "--assignment_statement_alignment=preserve",
        "--port_declarations_alignment=preserve",
        "--named_parameter_alignment=preserve",
        "--named_port_alignment=preserve",
        "--formal_parameters_alignment=preserve",
        "--class_member_variable_alignment=preserve",
        "--case_items_alignment=preserve",
      },
      -- format only the visual selection (:'<,'>ConformFormat / gq-style range)
      range_args = function(_, ctx)
        return { "--lines", ctx.range.start[1] .. "-" .. ctx.range["end"][1] }
      end,
    },
    ["clang-format"] = {
      prepend_args = {
        "-style={ \
                UseTab: Never, \
                AccessModifierOffset: 0, \
                IndentAccessModifiers: true, \
                PackConstructorInitializers: Never}",
      },
    },
    -- Python
    black = {
      prepend_args = {
        "--fast",
      },
    },
    isort = {
      prepend_args = {
        "--profile",
        "black",
      },
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
