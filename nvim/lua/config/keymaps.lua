vim.keymap.set("n", "<leader>bb", "<cmd>b#<cr>", { desc = "Toggle previous buffer" })

vim.keymap.set("n", "<leader>uw", function()
	vim.o.wrap = not vim.o.wrap
end, { desc = "Toggle wrap" })

vim.keymap.set("n", "<leader>uH", function()
	vim.o.list = not vim.o.list
	local estado = vim.o.list and "VISIBLES" or "OCULTOS"
	local color = vim.o.list and "DiagnosticWarn" or "DiagnosticOk"
	vim.api.nvim_echo({ { "Caracteres ocultos: " .. estado, color } }, false, {}) -- false: don't save it in :messages
end, { desc = "Toggle Hidden characters" })
