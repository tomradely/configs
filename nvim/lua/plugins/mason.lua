return {
	"mason-org/mason.nvim", version = "^1.0.0", lazy = false,
	config = function ()
		require("mason").setup({
		    ui = {
			icons = {
			    package_installed = "✓",
			    package_pending = "➜",
			    package_uninstalled = "✗"
			}
	    }
	})
end
}
