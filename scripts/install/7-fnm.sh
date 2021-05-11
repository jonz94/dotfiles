echo 'installing fnm...'

if type brew &> /dev/null; then
  brew install fnm
fi

if [ `uname` = 'Linux' ]; then
  curl -fsSL https://fnm.vercel.app/install | bash
fi
