-- List of servers to ignore during install
local ignore_install = { "clangd", "pyright" }

-- Get all available LSP servers from mason-lspconfig
-- local all_servers = require("mason-lspconfig").get_available_servers()
local servers_to_install = {
  "lua_ls",
  "bashls",
  "jsonls",
  "yamlls",
  "marksman",
  "verible",
}

-- Filter out ignored servers
local final_servers = {}
for _, server in ipairs(servers_to_install) do
  local skip = false
  for _, ignore in ipairs(ignore_install) do
    if server == ignore then
      skip = true
      break
    end
  end
  if not skip then
    table.insert(final_servers, server)
  end
end

-- Setup Mason with filtered list
require("mason-lspconfig").setup {
  ensure_installed = final_servers,
  automatic_installation = false,
}
