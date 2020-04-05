echo 'installing fnm...'

if `hash brew 2> /dev/null`; then
  brew install Schniz/tap/fnm
fi

if [ `uname` = 'Linux' ]; then
  curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash
fi
