# powerlevel10k settings

# main prompt elements
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context os_icon dir vcs newline prompt_char)
# right prompt elements
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ram battery)

# defines character set used by powerlevel10k. It's best to let `p10k configure` set it for you.
typeset -g POWERLEVEL9K_MODE=nerdfont-complete

# when set to `moderate`, some icons will have an extra space after them. This is meant to avoid
# icon overlap when using non-monospace fonts. When set to `none`, spaces are not added.
typeset -g POWERLEVEL9K_ICON_PADDING=moderate

# context dir colors
# typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='228'
# typeset -g POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='228'
# typeset -g POWERLEVEL9K_DIR_ETC_BACKGROUND='228'
# typeset -g POWERLEVEL9K_DIR_HOME_BACKGROUND='228'
# typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='228'

# vcs icons
typeset -g POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uf09b '
typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\uf13a '
typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\uf139 '

# set prompt background to white
typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND='white'
# default prompt symbol.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION=' '
# prompt symbol in command vi mode.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION=' '
# prompt symbol in visual vi mode.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION=' '
# prompt symbol in overwrite vi mode.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION=' '
typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
# no surrounding whitespace.
typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=

# os icon colors
typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND='white'
typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND='black'

# check if current os is ubuntu
if [[ $(lsb_release -i 2>/dev/null | cut -f 2) == "Ubuntu" ]]; then
  # use `nf-linux-ubuntu_inverse` as ubuntu's os icon
  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=' '
else
  # add extra space at the end of os icon
  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='${P9K_CONTENT} '
fi

# ram elements
typeset -g POWERLEVEL9K_RAM_ELEMENTS=(ram_free)
# ram colors
typeset -g POWERLEVEL9K_RAM_BACKGROUND='black'
typeset -g POWERLEVEL9K_RAM_FOREGROUND='249'

# remove extra space of the right prompt
typeset -g ZLE_RPROMPT_INDENT=0
