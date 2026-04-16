vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function()
		local filetype = vim.bo.filetype
		if filetype and filetype ~= "" then
			local success = pcall(function()
				vim.treesitter.start()
			end)
			if not success then
				return
			end
		end
	end,
})
