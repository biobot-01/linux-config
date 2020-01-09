# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [[ -n "${BASH_VERSION}" ]]; then
  # include .bashrc if it exists
  if [[ -f "${HOME}/.bashrc" ]]; then
	  . "${HOME}/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [[ -d "${HOME}/bin" ]]; then
  PATH="${HOME}/bin:${PATH}"
fi

# set PATH so it includes user's private bin if it exists
if [[ -d "${HOME}/.local/bin" ]]; then
  PATH="${HOME}/.local/bin:${PATH}"
fi

# set PATH so it includes php composer bin if it exists
export COMPOSER_DIR="${HOME}/.config/composer"

if [[ -d "${COMPOSER_DIR}/vendor/bin" ]]; then
  PATH="${COMPOSER_DIR}/vendor/bin:${PATH}"
fi

# NVM for managing node.js
export NVM_DIR="${HOME}/.nvm"

[[ -s "${NVM_DIR}/nvm.sh" ]] && \. "${NVM_DIR}/nvm.sh"  # This loads nvm
[[ -s "${NVM_DIR}/bash_completion" ]] && \. "${NVM_DIR}/bash_completion"  # This loads nvm bash_completion

# Enable tab completion
source "${HOME}/.terminal-config/git-completion"
# Change command prompt
source "${HOME}/.terminal-config/git-prompt"

# Colors
yellow="\[\033[1;33m\]"
red="\[\033[1;31m\]"
green="\[\033[1;32m\]"
blue="\[\033[1;34m\]"
aqua="\[\033[1;36m\]"
reset="\[\033[0m\]"

export GIT_PS1_SHOWDIRTYSTATE=1

# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="${green}\u${aqua}\$(__git_ps1)${red} \W
${blue}$ ${reset}"

