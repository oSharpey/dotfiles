return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_insttalled = { "lua_ls", "black", "ruff", "mypy" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })

            lspconfig.omnisharp.setup({
                capabilities = capabilities,
                cmd = { "dotnet", "/home/oscar/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
                filetypes = { "cs" },
                root_dir = function()
                    return vim.loop.cwd()
                end,
                enable_import_completion = true,
                organize_imports_on_format = true,
                enable_roslyn_analyzers = true,
            })

            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = { "clangd", "--offset-encoding=utf-16" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
            })

            lspconfig.pyright.setup({
                capabilities = capabilities,
                cmd = { "pyright-langserver", "--stdio" },
                filetypes = { "python" },
            })

            lspconfig.jdtls.setup({
                capabilities = capabilities,
                cmd = { "jdtls" },
            })

            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
