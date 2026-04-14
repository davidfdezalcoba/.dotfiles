vim.pack.add({
	{
		src = "https://github.com/obsidian-nvim/obsidian.nvim",
	},
})

local vaults_dir = vim.fn.expand("~/vaults")

-- Scan for subdirectories
local function get_workspaces()
	local handle = vim.loop.fs_scandir(vaults_dir)
	if not handle then
		return {}
	end

	local workspaces = {}

	while true do
		local name, type = vim.loop.fs_scandir_next(handle)
		if not name then
			break
		end

		if type == "directory" then
			table.insert(workspaces, {
				name = name,
				path = vaults_dir .. "/" .. name,
			})
		end
	end

	return workspaces
end

local workspaces = get_workspaces()

-- Only setup if at least one workspace exists
if #workspaces > 0 then
	require("obsidian").setup({
		legacy_commands = false,
		workspaces = workspaces,
		link = {
			style = "markdown",
			format = "shortest",
			auto_update = false,
		},
	})
end
