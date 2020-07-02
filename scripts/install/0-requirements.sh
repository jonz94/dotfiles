# git
if ! type git &> /dev/null; then
  if type apt-get &> /dev/null; then
    sudo apt install -y git
  elif type brew &> /dev/null; then
    brew install git
  elif type pacman &> /dev/null; then
    yes | sudo pacman -S git
  fi
fi

# curl
if ! type curl &> /dev/null; then
  if type apt-get &> /dev/null; then
    sudo apt install curl
  elif type pacman &> /dev/null; then
    yes | sudo pacman -s curl
  fi
fi
