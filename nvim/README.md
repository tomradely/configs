# My evolving Neovim configuration

Based on YouTube tutorials by John McBride, typecraft, and Ben Frain.

Currently in good working order.

## Capabilities

This config makes use of nvim's lua files to split plugins as called by packer from their setups, which each get their own files.  Plugins like alpha have setups which call further lua files to maintain theming functionality.

More can be done to clean up plugins.lua, moving things to the setups folder, but things are more or less fine for now, and more or less legible.

## Plugin highlights
    -- packer
        -- configured to use popup window as per packer documentation
    -- mason and mason-lsp
    -- neo-tree
    -- telescope and telescope fuzzy file finder
    -- nvim-cmp
        -- lsps for lua, yaml, and more
        -- currently setup for luasnip, but can do more
    -- treesitter
        -- automatically grabs parsers for new file formats
    -- visual-multi
        -- i still don't get how this works
    -- git-gutter
        -- i actually don't know what this is
    -- lualine

## Mappings

Mappings are called from mappings.lua, and include hotkeys for neo-tree and telescope.
