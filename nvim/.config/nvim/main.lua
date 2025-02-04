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

-- vim.api.nvim_command('set commentstring=//%s')
--

-- local llm = require('llm')
-- llm.setup({
--   api_token = nil, -- cf Install paragraph
--   backend = "ollama", -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
--   tokens_to_clear = { "<|endoftext|>" }, -- tokens to remove from the model's output
--   model = "deepseek-coder-v2:16b",
--   url = "http://quark:11434", -- llm-ls uses "/api/generate"
--   -- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
--   -- 
--   request_body = {
--     -- Modelfile options for the model you use
--     options = {
--       temperature = 0.2,
--       top_p = 0.95,
--     }
--   },
--
--   -- set this if the model supports fill in the middle
--   fim = {
--     enabled = false,
--     prefix = "<fim_prefix>",
--     middle = "<fim_middle>",
--     suffix = "<fim_suffix>",
--   },
--   debounce_ms = 600,
--   accept_keymap = "<Tab>",
--   dismiss_keymap = "<S-Tab>",
--   tls_skip_verify_insecure = false,
--   -- llm-ls configuration, cf llm-ls section
--   lsp = {
--     bin_path = nil,
--     host = nil,
--     port = nil,
--     cmd_env = nil, -- or { LLM_LOG_LEVEL = "DEBUG" } to set the log level of llm-ls
--     version = "0.5.3",
--   },
--   tokenizer = nil, -- cf Tokenizer paragraph
--   context_window = 1024, -- max number of tokens for the context window
--   enable_suggestions_on_startup = true,
--   enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
--   disable_url_path_completion = false, -- cf Backend
-- })
