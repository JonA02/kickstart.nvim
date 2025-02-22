return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require 'diffview.actions'

    require('diffview').setup {
      diff_binaries = false,
      enhanced_diff_hl = false,
      git_cmd = { 'git' },
      hg_cmd = { 'hg' },
      use_icons = true,
      show_help_hints = true,
      watch_index = true,
      icons = {
        folder_closed = '',
        folder_open = '',
      },
      signs = {
        fold_closed = '',
        fold_open = '',
        done = '✓',
      },
      view = {
        default = {
          layout = 'diff2_horizontal',
          disable_diagnostics = false,
          winbar_info = false,
        },
        merge_tool = {
          layout = 'diff3_horizontal',
          disable_diagnostics = true,
          winbar_info = true,
        },
        file_history = {
          layout = 'diff2_horizontal',
          disable_diagnostics = false,
          winbar_info = false,
        },
      },
      file_panel = {
        listing_style = 'tree',
        tree_options = {
          flatten_dirs = true,
          folder_statuses = 'only_folded',
        },
        win_config = {
          position = 'left',
          width = 35,
          win_opts = {},
        },
      },
      file_history_panel = {
        log_options = {
          git = {
            single_file = { diff_merges = 'combined' },
            multi_file = { diff_merges = 'first-parent' },
          },
          hg = {
            single_file = {},
            multi_file = {},
          },
        },
        win_config = {
          position = 'bottom',
          height = 16,
          win_opts = {},
        },
      },
      commit_log_panel = { win_config = {} },
      default_args = {
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      hooks = {},
      keymaps = {
        disable_defaults = false,
        view = {
          { 'n', '<tab>', actions.select_next_entry, { desc = 'Open the diff for the next file' } },
          { 'n', '<s-tab>', actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },
          { 'n', '[F', actions.select_first_entry, { desc = 'Open the diff for the first file' } },
          { 'n', ']F', actions.select_last_entry, { desc = 'Open the diff for the last file' } },
          { 'n', 'gf', actions.goto_file_edit, { desc = 'Open the file in the previous tabpage' } },
          { 'n', '<C-w><C-f>', actions.goto_file_split, { desc = 'Open the file in a new split' } },
          { 'n', '<C-w>gf', actions.goto_file_tab, { desc = 'Open the file in a new tabpage' } },
          { 'n', '<leader>e', actions.focus_files, { desc = 'Bring focus to the file panel' } },
          { 'n', '<leader>b', actions.toggle_files, { desc = 'Toggle the file panel.' } },
          { 'n', 'g<C-x>', actions.cycle_layout, { desc = 'Cycle through available layouts.' } },
          { 'n', '[x', actions.prev_conflict, { desc = 'Jump to the previous conflict' } },
          { 'n', ']x', actions.next_conflict, { desc = 'Jump to the next conflict' } },
          { 'n', '<leader>co', actions.conflict_choose 'ours', { desc = 'Choose the OURS version' } },
          { 'n', '<leader>ct', actions.conflict_choose 'theirs', { desc = 'Choose the THEIRS version' } },
          { 'n', '<leader>cb', actions.conflict_choose 'base', { desc = 'Choose the BASE version' } },
          { 'n', '<leader>ca', actions.conflict_choose 'all', { desc = 'Choose all versions' } },
          { 'n', 'dx', actions.conflict_choose 'none', { desc = 'Delete conflict region' } },
          { 'n', '<leader>cO', actions.conflict_choose_all 'ours', { desc = 'Choose OURS for the whole file' } },
          { 'n', '<leader>cT', actions.conflict_choose_all 'theirs', { desc = 'Choose THEIRS for the whole file' } },
          { 'n', '<leader>cB', actions.conflict_choose_all 'base', { desc = 'Choose BASE for the whole file' } },
          { 'n', '<leader>cA', actions.conflict_choose_all 'all', { desc = 'Choose all for the whole file' } },
          { 'n', 'dX', actions.conflict_choose_all 'none', { desc = 'Delete conflict for the whole file' } },
        },
        file_panel = {
          { 'n', 'j', actions.next_entry, { desc = 'Next file entry' } },
          { 'n', 'k', actions.prev_entry, { desc = 'Previous file entry' } },
          { 'n', '<cr>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
        },
      },
    }
  end,
}
