echo 'installing xkbswitch...'

if [ ! `uname` = "Darwin" ]; then
  echo 'xkbswitch only needed for macOS, skip installation.'
  exit 0
fi

if type xkbswitch &> /dev/null; then
  echo 'xkbswitch has been installed, skip installation.'
  exit 0
fi

curl -fsSL -o ~/.local/bin/xkbswitch --create-dirs https://raw.githubusercontent.com/myshov/xkbswitch-macosx/master/bin/xkbswitch
chmod +x ~/.local/bin/xkbswitch

echo 'xkbswitch is ready!'
