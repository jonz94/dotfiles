echo 'installing fnm...'

URL='https://fnm.vercel.app/install'

if type brew &> /dev/null; then
  brew install fnm
elif [ `uname -r | grep -i microsoft` ]; then
  curl.exe -fsSL $URL | sed "s/curl/curl.exe/" | bash
elif [ `uname` = 'Linux' ]; then
  curl -fsSL $URL | bash
fi
