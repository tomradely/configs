return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{'neovim/nvim-lspconfig'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-cmdline'},
		{'hrsh7th/cmp-path'},
--		{'L3MON4D3/LuaSnip'},
	},
	config = function ()
	-- Set up nvim-cmp.
	  local cmp = require'cmp'

	  cmp.setup({
	    snippet = {
	      -- REQUIRED - you must specify a snippet engine
	      expand = function(args)
		-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
		-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	      end,
	    },
	    window = {
	      completion = cmp.config.window.bordered(),
	      documentation = cmp.config.window.bordered(),
	    },
	    mapping = cmp.mapping.preset.insert({
	      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	      ['<C-f>'] = cmp.mapping.scroll_docs(4),
	      ['<C-Space>'] = cmp.mapping.complete(),
	      ['<C-e>'] = cmp.mapping.abort(),
	      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	    }),
	    sources = cmp.config.sources({
	      { name = 'nvim_lsp' },
	      -- { name = 'vsnip' }, -- For vsnip users.
	      -- { name = 'luasnip' }, -- For luasnip users.
	      { name = 'ultisnips' }, -- For ultisnips users.
	      -- { name = 'snippy' }, -- For snippy users.
	    }, {
	      { name = 'buffer' },
	    })
	  })

	  -- Set configuration for specific filetype.
	  cmp.setup.filetype('gitcommit', {
	    sources = cmp.config.sources({
	      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	    }, {
	      { name = 'buffer' },
	    })
	  })

	  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	  cmp.setup.cmdline({ '/', '?' }, {
	    mapping = cmp.mapping.preset.cmdline(),
	    sources = {
	      { name = 'buffer' }
	    }
	  })

	  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	  cmp.setup.cmdline(':', {
	    mapping = cmp.mapping.preset.cmdline(),
	    sources = cmp.config.sources({
	      { name = 'path' }
	    }, {
	      { name = 'cmdline' }
	    })
	  })

	  -- Set up lspconfig.
	  local capabilities = require('cmp_nvim_lsp').default_capabilities()
	  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	  require("mason").setup()
	  require("mason-lspconfig").setup()
	  require('lspconfig').lua_ls.setup {
	    capabilities = capabilities
	  }
	  require('lspconfig').jsonls.setup {
		  capabilities = capabilities
	  }
	  require('lspconfig').pylsp.setup {
		  capabilities = capabilities
	  }
	  require('lspconfig').yamlls.setup {
		  capabilities = capabilities
	  }
	  require('lspconfig').ansiblels.setup {
		  capabilities = capabilities
	  }
	  require('lspconfig').bashls.setup {
		  capabilities = capabilities
	  }
	    require('lspconfig').clangd.setup {
		  capabilities = capabilities
	  }
	  require('lspconfig').cmake.setup {
		  capabilities = capabilities
	  }
	  require('lspconfig').pyright.setup {
		  capabilities = capabilities
	  }
	  require('lspconfig').golangci_lint_ls.setup {
		  capabilities = capabilities
	  }
	  require('lspconfig').sqls.setup {
		  capabilities = capabilities
	  }
	  require('lspconfig').ts_ls.setup {
		  capabilities = capabilities
	  }
	  require('lspconfig').marksman.setup {
		  capabilities = capabilities
	  }
	  require('lspconfig').texlab.setup {
		  capabilities = capabilities
	  }
	  require('lspconfig').ltex.setup {
		  capabilities = capabilities
	  }
	  require('lspconfig').typos_lsp.setup {
		  capabilities = capabilities
	  }
	end,
}
