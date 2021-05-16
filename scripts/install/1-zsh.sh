echo 'installing zsh...'

if type nvim &> /dev/null; then
  echo 'zsh has been installed, skip installation.'
  exit 0
fi

if type pkg &> /dev/null; then
  pkg install -y zsh
elif type apt-get &> /dev/null; then
  sudo apt install -y zsh
elif type brew &> /dev/null; then
  brew install zsh
elif type pacman &> /dev/null; then
  yes | sudo pacman -S zsh
fi

read -p 'Change default login shell to Zsh? [y/N]: ' answer
case $answer in
  [Yy]* ) chsh -s `which zsh`;;
  * ) ;;
esac

echo 'zsh is ready!'
