# bun command aliases

if type bun &> /dev/null; then
  alias bls='bun pm ls'
  alias blsall='bun pm ls --all'
  alias blso='bun outdated'

  # equivalent of `npm ci`
  alias bci='rm -fr node_modules && bun install --frozen-lockfile'
fi
