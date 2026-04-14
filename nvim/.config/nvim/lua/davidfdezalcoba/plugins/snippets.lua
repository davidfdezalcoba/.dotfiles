vim.pack.add({
	{
		src = "https://github.com/L3MON4D3/LuaSnip",
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	},
})

vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'LuaSnip' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('LuaSnip') end
    vim.fn.jobstart(
      { "make", "install_jsregexp" },
      {
        cwd = vim.fn.stdpath("data") .. "/site/pack/core/start/LuaSnip",
        detach = true,
      }
    )
  end
end })
