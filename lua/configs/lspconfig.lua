local lspconfig = vim.lsp.config

-- Shared on_attach: Add keymaps and features for all LSPs
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
end

-- Capabilities for better completion support
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Helper function for root_dir detection
local function get_root_dir()
  return vim.fs.root(0, { ".git", "Makefile", "CMakeLists.txt" })
end

------------------------------------------------------------
-- LSP SERVER CONFIGS
------------------------------------------------------------

-- Lua
lspconfig("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = get_root_dir(),
})

-- Python
lspconfig("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = get_root_dir(),
})

-- C/C++
lspconfig("clangd", {
  cmd = { "clangd", "--header-insertion=never" },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = get_root_dir(),
})

-- SystemVerilog / Verilog
lspconfig("verible", {
  cmd = { "verible-verilog-ls", "--rules=+line-length=length:200+explicit-parameter-storage-type=false" },
  filetypes = { "verilog", "systemverilog" },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = get_root_dir(),
})

-- Bash
lspconfig("bashls", {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = get_root_dir(),
})

-- JSON
lspconfig("jsonls", {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = get_root_dir(),
})

-- YAML
lspconfig("yamlls", {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = get_root_dir(),
})

-- Markdown
lspconfig("marksman", {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = get_root_dir(),
})
