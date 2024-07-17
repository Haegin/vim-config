filetype off

source $HOME/.config/nvim/config/preload.vim
source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/general.vim
source $HOME/.config/nvim/config/filetype.vim
source $HOME/.config/nvim/config/keys.vim
source $HOME/.config/nvim/config/plugin-config.vim
source $HOME/.config/nvim/config/completion.vim
source $HOME/.config/nvim/config/commands.vim
source $HOME/.config/nvim/config/rails-projections.vim
source $HOME/.config/nvim/config/runtimes.vim
source $HOME/.config/nvim/config/language-servers.vim

if has('macunix')
  source $HOME/.config/nvim/config/mac.vim
endif

lua << EOF
  require("plugin-config")
  require("colours")
  require("langs")
  require("mason-config")
  require("treesitter-config")
EOF
