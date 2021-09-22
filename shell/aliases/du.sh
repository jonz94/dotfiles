# disk usage related commands aliases

if type dust &> /dev/null; then
  alias du='dust'
  alias du.='dust .'
else
  alias du='du -h'
  alias du.='du --max-depth=1 .'
fi
