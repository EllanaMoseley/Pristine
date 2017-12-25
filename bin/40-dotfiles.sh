#!/bin/zsh

################################################################################
# Install dotfiles

echo ""
echo "Setting up dotfiles ..."
if ! type "stow" > /dev/null; then
  echo "... installing stow"
  brew install stow
fi

#####################################
echo "... bootstrapping stow"

cat <<EOF > $HOME/.stowrc
--dir=$(pwd)/dotfiles
--target=$HOME
--ignore=.DS_Store
EOF

#####################################
# Add directory/names of apps below to have
# their dotfiles installed by stow during setup
stow -v --stow  \
  stow          \
  bash          \
  tmux

#####################################
# zshrc is a special case as it's being looked after by zprezto
echo "... installing custom .zshrc ..."
rm -f ${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc
cp conf/zsh/zshrc ${ZDOTDIR:-$HOME}/.zprezto/runcoms/