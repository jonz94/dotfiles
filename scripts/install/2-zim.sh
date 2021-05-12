echo 'installing zim...'

if [ -d ~/.zim ]; then
  echo 'zim has been installed, skip installation.'
  exit 0
fi

URL='https://raw.githubusercontent.com/zimfw/install/master/install.zsh'

if [ `uname -r | grep -i microsoft` ]; then
  curl.exe -fsSL $URL | zsh
else
  curl -fsSL $URL | zsh
fi

echo 'zim is ready!'
