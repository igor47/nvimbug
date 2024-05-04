-- Automatically install lazy.nvim
local lazypath = "./lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
require("lazy").setup({
  -- plenery is a collection of functions used by lots of other plugins
  "nvim-lua/plenary.nvim",

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", tag = "v0.9.2", build = ":TSUpdate" },

  -- LSP configure
  { "neovim/nvim-lspconfig" },  -- to configure built-in LSP

  --  mason
  { "williamboman/mason.nvim" },  -- installs external plugins e.g. language servers
  { "williamboman/mason-lspconfig.nvim" },
}, { root = "./plugins" })
