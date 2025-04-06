# yarn command aliases

if type yarn &> /dev/null; then
  # equivalent of `npm ci`
  alias yci='rm -fr node_modules && yarn install --frozen-lockfile'
fi
