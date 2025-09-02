local lint = require "lint"

lint.linters_by_ft = {
  lua = { "luacheck" },
  python = { "flake8" },
  -- systemverilog = { "verilator" },
  -- verilog = { "verilator" },
}

lint.linters.luacheck.args = {
  "--globals",
  "vim",
  "--formatter",
  "plain",
  "--codes",
  "--ranges",
  "-",
}

lint.linters.flake8.args = {
  "--ignore=E501", -- Ignore all line length warnings
  "-", -- Read from stdin
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
