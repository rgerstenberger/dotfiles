#!/usr/bin/env bash

# prompt themeing
source "$DOTFILES/bash/bash-it.color.theme"
source "$DOTFILES/bash/bash-it.base.theme"

function ssh_info {
  if [ ! -z "$SSH_CONNECTION" ]; then
    echo -e "${reset_color}${white}@${reset_color}${bold_purple}\h"
  fi
}

ssh_connection_info="$(ssh_info)"

function ruby_info {

  if ! [ -z "$(ruby_version_prompt)" ]; then
    echo -e "${reset_color}${bold_red}\$(ruby_version_prompt) "
  fi
}

ruby_info="$(ruby_info)"

#added TITLEBAR for updating the tab and window titles with the pwd
case $TERM in
  xterm*)
  TITLEBAR="\[\033]0;\w\007\]"
  ;;
  *)
  TITLEBAR=""
  ;;
esac
PROMPT="${bold_purple}\u${reset_color}${white}${TITLEBAR}${ssh_connection_info}${reset_color}${white}:${reset_color}${green}\w ${ruby_info}${reset_color}${white}\$(scm_char) ${reset_color}${bold_blue}\$(scm_prompt_info) ${reset_color}${normal} \n"


# scm themeing
SCM_THEME_PROMPT_DIRTY=" ✗"
SCM_THEME_PROMPT_CLEAN=" ✓"
SCM_THEME_PROMPT_PREFIX="("
SCM_THEME_PROMPT_SUFFIX=")"

RVM_THEME_PROMPT_PREFIX='('
RVM_THEME_PROMPT_SUFFIX=')'
RBENV_THEME_PROMPT_PREFIX='('
RBENV_THEME_PROMPT_SUFFIX=')'

export PS1=$PROMPT
