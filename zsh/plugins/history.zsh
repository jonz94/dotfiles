# https://github.com/mattjj/my-oh-my-zsh/blob/master/history.zsh
#
# Sets history options.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"

# make sure history file exists
touch $HISTFILE

HISTSIZE=10000000
SAVEHIST=10000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# advanced history ignore configuration
# credit: https://stackoverflow.com/a/6936301/9979122
#
# any command matches one of the following pattern will not be added to the history file
#
#     - starts with "cd"
#     - starts with "rm"
#     - has "--password" in it
#     - ends with "fl"
#
function zshaddhistory() {
  emulate -L zsh

  if [[ "$1" =~ "(^cd|^rm|--password|.*fl$)" ]]; then
    return 1
  fi
}
