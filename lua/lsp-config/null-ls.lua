local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting

local sources = {
    formatting.rustfmt,
    null_ls.builtins.diagnostics.cspell, 
    null_ls.builtins.code_actions.cspell
}

null_ls.setup({
    sources = sources
})
