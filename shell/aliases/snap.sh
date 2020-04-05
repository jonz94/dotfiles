# snap command aliases

if `hash snap 2>/dev/null`; then
  alias sud='snap refresh --list'
  alias sug='sudo snap refresh'
fi
