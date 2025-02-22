return {

  require('lspconfig').marksman.setup {
    handlers = {
      ['textDocument/documentHighlight'] = function() end,
    },
  },
}
