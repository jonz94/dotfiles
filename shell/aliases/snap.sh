# snap command aliases

if type snap &> /dev/null; then
  alias sud='snap refresh --list'
  alias sug='sudo snap refresh'
fi
