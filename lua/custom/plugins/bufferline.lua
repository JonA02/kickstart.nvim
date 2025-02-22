return {

  bufferline = require('bufferline').setup {

    options = {

      highlights = {
        background = {
          bg = '#1A1B27',
        },
      },

      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match 'error' and ' ' or ' '
        return ' ' .. icon .. count
      end,

      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          text_align = 'left',
          separator = false,
        },
      },
    },
  },
}
