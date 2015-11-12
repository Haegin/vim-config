#!/bin/zsh
setopt extendedglob

DOTDIR="${HOME}/.vim-config"

cd "$DOTDIR"

echo "Setting up submodules"
git submodule update --init

# Only want to symlink the files, not the utility scripts
echo "Linking files into ${HOME} from ${DOTDIR}:"
for item in *~(bin|config|README); do
  if [ ! -e "${HOME}/.${item}" ]; then
    echo "- .${item}"
    ln -s "${DOTDIR}/${item}" "${HOME}/.${item}"
  fi
done
echo "Linking files into ${HOME}/.config from ${DOTDIR}/config:"
for item in config/*; do
  if [ ! -e "${HOME}/.${item}" ]; then
    echo "- .${item}"
    ln -s "${DOTDIR}/${item}" "${HOME}/.${item}"
  fi
done

echo "Linking ~/.config/nvim to ~/.vim"
ln -s "${HOME}/.config/nvim" "${HOME}/.nvim"

#echo "Installing plugins"
#vim +PlugInstall +qall

echo "\nFinished!"
