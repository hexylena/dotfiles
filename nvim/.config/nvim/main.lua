local lspconfig = require("lspconfig")
lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

lspconfig.pyright.setup({
  cmd = {"/home/user/.config/nvm/versions/node/v20.10.0/bin/pyright-langserver", "--stdio"},
})

lspconfig.gleam.setup({})
