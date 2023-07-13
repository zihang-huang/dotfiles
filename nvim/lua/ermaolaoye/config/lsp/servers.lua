local servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    checkThirdParty = false,
                },
                completion = {
                    callSnippet = "Replace",
                },
                misc = {
                    parameters = {
                        "--log-level=trace",
                    },
                },
                format = {
                    enable = false,
                    defaultConfig = {
                        indent_style = "space",
                        indent_size = "2",
                        continuation_indent_size = "2",
                    },
                },
            },
        },
    },
    clangd = {},
    pyright = {},
    rust_analyzer = {},
    gopls = {},
}

return servers
