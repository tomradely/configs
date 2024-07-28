return {
	'goolord/alpha-nvim',
	config = function ()
		require'alpha'.setup(require'mydashboard'.config)
	end
}
