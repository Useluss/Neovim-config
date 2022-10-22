local nvim_lsp = require("lspconfig")
local mason = require("mason")
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()

local lsp_flags = {
    debounce_text_changes = 150,
}

-- Add additional capabilities suppported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

nvim_lsp['rust_analyzer'].setup {
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {}
    }
}

nvim_lsp['sumneko_lua'].setup {
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        diagnostics = {
            globals = { "vim" }
        }
    }
}

nvim_lsp['ltex'].setup {
    flags = lsp_flags,
    capabilities = capabilities,
}
