echo 'installing zsh...'

if `hash apt-get 2> /dev/null`; then
  sudo apt install -y zsh
fi

if `hash brew 2> /dev/null`; then
  brew install zsh
fi

if `hash pacman 2> /dev/null`; then
  yes | sudo pacman -S zsh
fi

read -p 'Change default login shell to Zsh? [y/N]: ' answer
case $answer in
  [Yy]* ) chsh -s `which zsh`;;
  * ) ;;
esac

echo 'zsh is ready!'
