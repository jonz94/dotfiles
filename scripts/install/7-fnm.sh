echo 'installing fnm...'

if [ `uname -r | grep -i ish` ]; then
  echo 'fnm does not work on ish currently, skip installation.'
  exit 0
fi

URL='https://fnm.vercel.app/install'

if type brew &> /dev/null; then
  brew install fnm
elif [ `uname -r | grep -i microsoft` ]; then
  curl.exe -fsSL $URL | sed "s/curl/curl.exe/" | bash
elif [ `uname` = 'Linux' ]; then
  curl -fsSL $URL | bash
fi
