local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
  cmd = { "yarn", "typescript-language-server", "--stdio" },
})
