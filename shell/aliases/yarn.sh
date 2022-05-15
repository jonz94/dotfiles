# yarn command aliases

if type yarn &> /dev/null; then
  alias ya='yarn add'
  alias yad='yarn add --dev'
  alias ylso='yarn outdated'
  alias yr='yarn run'
  alias yrm='yarn remove'

  # equivalent of `npm ci`
  alias yci='rm -fr node_modules && yarn install --frozen-lockfile'
fi
