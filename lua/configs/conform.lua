local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "isort", "black" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  formatters = {
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

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
