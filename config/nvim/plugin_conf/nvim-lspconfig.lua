local nvim_lsp = require('lspconfig');
nvim_lsp.bashls.setup {}
nvim_lsp.clangd.setup {
    cmd = {
        vim.g['my_clangd']
    },
}
nvim_lsp.pylsp.setup {}
nvim_lsp.zls.setup {}
vim.api.nvim_set_keymap("n", "g]", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "g[", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
