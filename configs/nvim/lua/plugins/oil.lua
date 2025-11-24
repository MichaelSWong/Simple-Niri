return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		lsp_file_methods = {
			enabled = false,
		},
		view_options = {
			show_hidden = true,
		},
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
