return {
    "nvimtools/none-ls.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.mdformat,
                null_ls.builtins.diagnostics.markdownlint,
            },
        })
    end,
}
