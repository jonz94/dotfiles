echo 'installing zoxide...'

if type zoxide &> /dev/null; then
  echo 'zoxide has been installed, skip installation.'
  exit 0
fi

if type pkg &> /dev/null; then
  pkg install -y zoxide
elif type apt-get &> /dev/null; then
  sudo apt install -y zoxide
elif type brew &> /dev/null; then
  brew install zoxide
elif type apk &> /dev/null; then
  apk add zoxide
fi

echo 'zoxide is ready!'
