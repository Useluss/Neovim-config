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

local ih = require("inlay-hints").setup({
  only_current_line = false,

  eol = {
    right_align = true,
  }
})

local lsp_flags = {
    debounce_text_changes = 150,
}

-- Add additional capabilities suppported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local rust_opts = {
    tools = {
        on_initialized = function ()
            ih.set_all()
        end,
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {
            auto = true,
            show_paramater_hints = true,
            paramater_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
}

nvim_lsp['rust_analyzer'].setup {
    require("rust-tools").setup(rust_opts),
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {}
    }
}

nvim_lsp['lemminx'].setup {
    flags = lsp_flags,
    capabilities = capabilities,
}

nvim_lsp['marksman'].setup {
    flags = lsp_flags,
    capabilities = capabilities,
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
