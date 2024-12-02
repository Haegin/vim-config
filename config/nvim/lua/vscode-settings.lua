if vim.g.vscode then
  keymap('n', '<Leader>nr', notify 'references-view.findReferences', { silent = true }) -- language references
  keymap('n', '<Leader>ni', notify 'workbench.actions.view.problems', { silent = true }) -- language diagnostics
  keymap('n', '<Leader>gi', notify 'editor.action.goToImplementation', { silent = true })
  keymap('n', '<Leader>gd', notify 'editor.action.goToDefinition', { silent = true })
  keymap('n', 'gr', notify 'editor.action.goToReferences', { silent = true })
  keymap('n', '<Leader>rn', notify 'editor.action.rename', { silent = true })
  keymap('n', '<Leader>fm', notify 'editor.action.formatDocument', { silent = true })
  keymap('n', '<Leader>ca', notify 'editor.action.refactor', { silent = true }) -- language code actions

  keymap('n', '<Leader>rg', notify 'workbench.action.findInFiles', { silent = true }) -- use ripgrep to search files
  keymap('n', '<Leader>ts', notify 'workbench.action.toggleSidebarVisibility', { silent = true })
  keymap('n', '<Leader>th', notify 'workbench.action.toggleAuxiliaryBar', { silent = true }) -- toggle docview (help page)
  keymap('n', '<Leader>tp', notify 'workbench.action.togglePanel', { silent = true })
  keymap('n', '<Leader>fc', notify 'workbench.action.showCommands', { silent = true }) -- find commands
  keymap('n', '<Leader>p', notify 'workbench.action.quickOpen', { silent = true }) -- find files
  keymap('n', '<Leader>tt', notify 'workbench.action.terminal.toggleTerminal', { silent = true }) -- terminal window
  keymap('n', ']s', notify 'editor.action.marker.next', { silent = true })
  keymap('n', '[s', notify 'editor.action.marker.prev', { silent = true })
end