return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.6',
	dependencies = {'nvim-lua/plenary.nvim',
			'debugloop/telescope-undo.nvim',
		},
	keys = {
		{ "<leader>fd", "<cmd>Telescope find_files<cr>", desc = "Telescope" },
		{ "<leader>lg", "<cmd>Telescope live_grep<cr>", desc = "Telescope" },
	},
	config = function ()
		require('telescope').setup({
		  defaults = {
		    -- Default configuration for telescope goes here:
		    -- config_key = value,
		    mappings = {
		      i = {
			-- map actions.which_key to <C-h> (default: <C-/>)
			-- actions.which_key shows the mappings for your picker,
			-- e.g. git_{create, delete, ...}_branch for the git_branches picker
			["<C-h>"] = "which_key"
		      }
	      	  }
		  },
		  pickers = {
		    -- Default configuration for builtin pickers goes here:
		    -- picker_name = {
		    --   picker_config_key = value,
		    --   ...
		    -- }
		    -- Now the picker_config_key will be applied every time you call this
		    -- builtin picker
		    live_grep = {
			    theme = "dropdown",
		    }
		  },
		  extensions = {
		    -- Your extension configuration goes here:
		    -- extension_name = {
		    --   extension_config_key = value,
		    -- }
		    -- please take a look at the readme of the extension you want to configure
		    undo = {
			    use_delta = true,
			    use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is : { "bash", "-c", "echo '$DIFF' | delta" }
			    side_by_side = true,
			    vim_diff_opts = {
				    ctxlen = vim.o.scrolloff,
			    },
			    entry_format = "state #$ID, $STAT, $TIME",
			    time_format = "",
			    saved_only = false,
			    layout_strategy = "horizontal",
			    layout_config = {
				    preview_height = 0.8,
			    },
			    mappings = {
				    i = {
				    ["<cr>"] = require("telescope-undo.actions").restore,
				    ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
			  	    ["<C-cr>"] = require("telescope-undo.actions").yank_additions,
		  -- alternative defaults, for users whose terminals do questionable things with modified <cr>
		 		     ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
		 		     ["<C-r>"] = require("telescope-undo.actions").restore,
				},
				    n = {
				     ["y"] = require("telescope-undo.actions").yank_additions,
			   	     ["Y"] = require("telescope-undo.actions").yank_deletions,
		  		     ["u"] = require("telescope-undo.actions").restore,
				},
			}
		}
	    }
    	})
	require("telescope").load_extension("undo")
	vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
end
}
