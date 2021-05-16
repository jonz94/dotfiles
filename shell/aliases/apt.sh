# apt command aliases

if type apt-get &> /dev/null; then
  alias i='sudo apt install'

  alias aarm='sudo apt autoremove'
  alias aud='sudo apt update && apt list --upgradable'
  alias aug='sudo apt upgrade'
  alias ud='sudo apt update && apt list --upgradable'
  alias ug='sudo apt upgrade'
fi

# termux emulator
if [ -n "`uname -a | grep Android`" ]; then
  alias i='apt install'

  alias aarm='apt autoremove'
  alias aud='apt update && apt list --upgradable'
  alias aug='apt upgrade'
  alias ud='apt update && apt list --upgradable'
  alias ug='apt upgrade'
fi
