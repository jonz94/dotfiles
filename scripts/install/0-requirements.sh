# git
if ! `hash git 2> /dev/null`; then
  if `hash apt-get 2> /dev/null`; then
    sudo apt install -y git
  elif `hash brew 2> /dev/null`; then
    brew install git
  elif `hash pacman 2> /dev/null`; then
    yes | sudo pacman -S git
  fi
fi

# curl
if ! `hash curl 2> /dev/null`; then
  if `hash apt-get 2> /dev/null`; then
    sudo apt install curl
  elif `hash pacman 2> /dev/null`; then
    yes | sudo pacman -s curl
  fi
fi
