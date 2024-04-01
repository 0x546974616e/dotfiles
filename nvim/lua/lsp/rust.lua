
-- Donwload: rustup component add rust-analyzer

-- Documentations:
-- https://rust-analyzer.github.io/manual.html
-- https://rust-analyzer.github.io/manual.html#nvim-lsp
-- https://sharksforarms.dev/posts/neovim-rust/
-- https://github.com/sharksforarms/neovim-rust
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer

require("lspconfig").rust_analyzer.setup({
  on_attach = function(client, bufnr)
    -- unstable API (https://www.reddit.com/r/neovim/comments/14em0f8/comment/joy3j4c/)
    -- Inlay hints are supported only in the dev 0.10 version, not the current 0.9.5 version.

    -- 2023-08
    -- if client.server_capabilities.inlayHintProvider then
    --   vim.lsp.buf.inlay_hint(bufnr, true)
    -- end

    -- 2023-12
    -- vim.lsp.inlay_hint.enable(bufnr, true)

    -- 2024-05
    -- vim.lsp.inlay_hint.enable(bufnr)

    vim.lsp.inlay_hint.enable(bufnr, true)
  end
})

