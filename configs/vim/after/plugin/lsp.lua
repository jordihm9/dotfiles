require('mason').setup()
local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = {
    'typescript-language-server', -- TypeScript/JavaScript/TSX
    'eslint-lsp',    -- ESLint
    'eslint_d',     -- ESLint daemon
    'biome',          -- Biome formatter
    'css-lsp',      -- CSS
    'css-variables-language-server', -- CSS Variables
    'cssmodules-language-server', -- CSS Modules
    'lua-language-server', -- Lua
    'python-lsp-server', -- Python
    'html-lsp',    -- HTML
    'json-lsp',    -- JSON
    'bash-language-server', -- Bash
    'yaml-language-server', -- YAML
    'dockerfile-language-server', -- Dockerfile
    'docker_compose_language_service', -- Docker Compose
    'emmet_language_server', -- Emmet
  },
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

-- declare mappings for nvim-cmp and lspconfig
-- tab for completion, shift-tab for previous Completion
-- -- enter for confirm completion, ctrl-space for manual trigger
local mappings = {
  ['<Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item(cmp_select)
    else
      fallback()
    end
  end, {'i', 's'}),
  
  ['<S-Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item(cmp_select)
    else
      fallback()
    end
  end, {'i', 's'}),
  
  ['<CR>'] = cmp.mapping.confirm({select = true}),
  
  ['<C-Space>'] = cmp.mapping.complete(),
}

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local luasnip = require('luasnip')

-- Define on_attach function to be used for all LSP servers
local on_attach = function(client, bufnr)
  print("LSP" .. client.name .. " started.")
  local opts = {buffer = bufnr, remap = false}
  -- Enable completion capabilities for the client
  client.server_capabilities.completionProvider = {
    triggerCharacters = {'.', '(', '[', '"', "'", '`'},
    resolveProvider = true,
  }
  
  -- Set up nvim-cmp
  cmp.setup.buffer({
    sources = {
      {name = 'nvim_lsp'},
      {name = 'buffer'},
      {name = 'path'},
      {name = 'luasnip'},
      -- add copilot if needed
      {name = 'copilot', group_index = 2},
    },
    mapping = mappings,
  })

  
  -- Add your keymappings here
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

-- Setup all servers with the common configuration
for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities
  })
end
