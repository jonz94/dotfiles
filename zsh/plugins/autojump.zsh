# load autojump

if [ -f /usr/share/autojump/autojump.zsh ]; then
  # Ubuntu: sudo apt install autojump
  source /usr/share/autojump/autojump.zsh
elif [ -f /usr/local/etc/profile.d/autojump.sh ]; then
  # macOS: brew install autojump
  source /usr/local/etc/profile.d/autojump.sh
fi
