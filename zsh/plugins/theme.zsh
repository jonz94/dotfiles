# Powerlevel Theme settings
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_VCS_GIT_ICON='\ue702'
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\uf13a '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\uf139 '
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%K{white}%F{black} %f%k%F{white}%f '
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context os_icon dir vcs)

# color
POWERLEVEL9K_OS_ICON_BACKGROUND='white'
POWERLEVEL9K_OS_ICON_FOREGROUND='black'
# POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='228'
# POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='228'
# POWERLEVEL9K_DIR_ETC_BACKGROUND='228'
# POWERLEVEL9K_DIR_HOME_BACKGROUND='228'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='228'
POWERLEVEL9K_RAM_BACKGROUND='black'
POWERLEVEL9K_RAM_FOREGROUND='249'

# check if current os is ubuntu
if [ $(lsb_release -i 2>/dev/null | cut -f 2) = "Ubuntu" ]; then
  # use `nf-linux-ubuntu_inverse` as ubuntu's os icon
  POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=' '
else
  # add extra space at the end of os icon
  POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='${P9K_CONTENT} '
fi

# remove extra space of the right prompt
ZLE_RPROMPT_INDENT=0

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ram battery)
