#!/bin/zsh
setopt extendedglob

DOTDIR="${HOME}/.vim-config"

cd "$DOTDIR"

echo "Setting up submodules"
git submodule update --init

# Only want to symlink the files, not the utility scripts
echo "Linking files into ${HOME} from ${DOTDIR}:"
for item in *~(bin|README); do
  if [ ! -e "${HOME}/.${item}" ]; then
    echo "- .${item}"
    ln -s "${DOTDIR}/${item}" "${HOME}/.${item}"
  fi
done

echo "Installing the Vundled plugins"
vim +BundleInstall +qall

echo "\nFinished!"
