local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
    },
    on_attach = function(client)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = "LspFormatting", buffer = 0 })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
                buffer = 0,
                callback = function() vim.lsp.buf.format({ async = false }) end,
            })
        end
    end,
})

