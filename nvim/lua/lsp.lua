local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
---@diagnostic disable-next-line: inject-field
capabilities.textDocument.completion.editsNearCursor = true

vim.lsp.config("clangd", {
    cmd = {
        "clangd", "--background-index", "--suggest-missing-includes",
        "--all-scopes-completion", "--completion-style=detailed"
    },
    filetypes = { "c", "c++", "cpp" },
    capabilities = capabilities
})
vim.lsp.enable("clangd")

vim.lsp.enable("hls")

vim.lsp.config('lua_ls', {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT',
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
})
