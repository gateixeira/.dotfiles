local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
	  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	  ['<C-y'] = cmp.mapping.confirm({ select = true }),
	  ['<C-Space>'] = cmp.mapping.complete(),
  })
})


lsp_zero.set_preferences({
  sign_icons = { }
})

lsp_zero.setup_servers({ "tsserver", "eslint", "gopls", "solargraph", "jdtls" })
