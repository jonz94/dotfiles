# unicode helper functions

print-unicode () {
  echo "\u$1"
}

print-unicode-how () {
  echo "Use following command:"
  echo
  echo "\techo \$'\\\\u____'"
  echo
  echo "For example:"
  echo
  echo "\techo \$'\\\\u5e25'"
  echo
  echo "will output:"
  echo
  echo "\t\u5e25"
  echo
}
