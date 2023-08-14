vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.colorcolumn = "80"
vim.opt.autoindent = true
vim.opt.smartindent = true

require("mason").setup()
require('monokai').setup {}

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
