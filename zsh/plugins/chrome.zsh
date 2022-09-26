# google chrome

# credits: https://stackoverflow.com/questions/3102819/disable-same-origin-policy-in-chrome
chrome-with-cors-disabled() {
  USER_DATA_DIR=$HOME/chrome-with-cors-disabled

  mkdir -p $USER_DATA_DIR

  if [ $(uname) = "Darwin" ]; then
    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security --user-data-dir=$USER_DATA_DIR &>/dev/null &
  elif type google-chrome-stable &> /dev/null; then
    google-chrome-stable --disable-web-security --user-data-dir=$USER_DATA_DIR &>/dev/null &
  else
    printf "${RED}google chrome executable not found.${NORMAL}\n"
    exit 1
  fi
}
