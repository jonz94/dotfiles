echo 'installing fnm...'

if [ `uname -r | grep -i ish` ]; then
  echo 'fnm does not work on ish currently, skip installation.'
  exit 0
fi

if type brew &> /dev/null; then
  brew install fnm
else
  curl -fsSL https://fnm.vercel.app/install | bash
fi
