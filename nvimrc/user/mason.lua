-- we might need lspconfig loaded already? this is how nvim-basic-ide does it
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    'ruff_lsp', 'pylsp', 'pyright'
  },
  automatic_installation = true
})
