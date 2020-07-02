echo 'installing zsh...'

if type apt-get &> /dev/null; then
  sudo apt install -y zsh
fi

if type brew &> /dev/null; then
  brew install zsh
fi

if type pacman &> /dev/null; then
  yes | sudo pacman -S zsh
fi

read -p 'Change default login shell to Zsh? [y/N]: ' answer
case $answer in
  [Yy]* ) chsh -s `which zsh`;;
  * ) ;;
esac

echo 'zsh is ready!'
