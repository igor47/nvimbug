local capabilities = vim.lsp.protocol.make_client_capabilities()

-- we need to set up each language server we use
-- see:
-- https://github.com/neovim/nvim-lspconfig#suggested-configuration
local lspconfig = require("lspconfig")

-- we set up all available lsp servers automatically
require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end,
})
