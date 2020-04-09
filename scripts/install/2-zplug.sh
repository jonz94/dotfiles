echo 'installing zplug...'

# install gawk
if `hash apt-get 2> /dev/null`; then
  sudo apt install -y gawk
fi

if `hash pacman 2> /dev/null`; then
  yes | sudo pacman -S gawk
fi

if [ -d ~/.zplug ]; then
  echo 'zplug has been installed, skip installation.'
  exit 0
fi

URL=https://raw.githubusercontent.com/zplug/installer/master/installer.zsh

curl -sL --proto-redir -all,https $URL | zsh

echo 'zplug is ready!'
