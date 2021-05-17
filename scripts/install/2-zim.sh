echo 'installing zim...'

if [ -d ~/.zim ]; then
  echo 'zim has been installed, skip installation.'
  exit 0
fi

backup $HOME/.zshenv
backup $HOME/.zshrc
backup $HOME/.zlogin
backup $HOME/.zimrc

URL='https://raw.githubusercontent.com/zimfw/install/master/install.zsh'

if [ `uname -r | grep -i microsoft` ]; then
  curl.exe -fsSL $URL | zsh
else
  curl -fsSL $URL | zsh
fi

# remove templates provides by zimfw installer
rm $HOME/.zshenv $HOME/.zshrc $HOME/.zlogin $HOME/.zimrc

echo 'zim is ready!'
