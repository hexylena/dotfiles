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

lspconfig.pyright.setup({})

-- vim.api.nvim_command('set commentstring=//%s')
