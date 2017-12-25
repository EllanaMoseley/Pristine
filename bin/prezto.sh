#!/bin/zsh

################################################################################
# Install Prezto

echo ""
echo "Installing Prezto ..."
if [[ -f ${ZDOTDIR:-$HOME}/.zprezto/init.zsh ]]; then
  source ${ZDOTDIR:-$HOME}/.zprezto/init.zsh || true
  echo "... Prezto already installed (updating ...)"
  ## PERFORMING UPDATES
  # Run this command ...
  zprezto-update
  # or, pull the latest changes and update submodules manually with:
  # $ cd $ZPREZTODIR
  # $ git pull && git submodule update --init --recursive
else
  if [[ -d ${ZDOTDIR:-$HOME}/.zprezto ]]; then
    rm -rf ${ZDOTDIR:-$HOME}/.zprezto
  fi
  if [[ -f ${ZDOTDIR:-$HOME}/.zpreztorc ]]; then
    rm -f ${ZDOTDIR:-$HOME}/.zpreztorc
  fi
  git clone --recursive https://github.com/sorin-ionescu/prezto.git ${ZDOTDIR:-$HOME}/.zprezto
  # Configure prezto
  setopt EXTENDED_GLOB
  for rcfile in ${ZDOTDIR:-$HOME}/.zprezto/runcoms/^README.md(.N); do
    rm -f ${ZDOTDIR:-$HOME}/.${rcfile:t}
    ln -s $rcfile ${ZDOTDIR:-$HOME}/.${rcfile:t}
  done
fi

#####################################
echo "... adding custom prompt ..."

cp conf/prezto/prompt_timecode_setup.sh ${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/functions/prompt_timecode_setup
if [ $? -ne 0 ]; then
  echo "... continuing ..."
fi

#####################################
echo "... modifying .zpretzorc ..."

sed -i '' "s/zstyle ':prezto:module:prompt' theme 'sorin'/zstyle ':prezto:module:prompt' theme 'timecode'/g" ${ZDOTDIR:-$HOME}/.zpreztorc
sed -i '' "s/zstyle ':prezto:module:editor' key-bindings 'emacs'/zstyle ':prezto:module:editor' key-bindings 'vi'/g" ${ZDOTDIR:-$HOME}/.zpreztorc

#####################################
echo "... installing custom .zshrc ..."

rm -f ${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc
cp conf/zsh/zshrc ${ZDOTDIR:-$HOME}/.zprezto/runcoms/
