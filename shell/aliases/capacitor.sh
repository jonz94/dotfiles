# capacitor command aliases

if type npx &> /dev/null; then
  alias coa='npx cap open android'

  if [ "$(uname)" = "Darwin" ]; then
    alias coi='npx cap open ios'
  fi
fi
