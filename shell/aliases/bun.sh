# bun command aliases

if type bun &> /dev/null; then
  alias bid='bun add --dev'
  alias bis='bun add'
  alias bls='bun pm ls'
  alias blsall='bun pm ls --all'
  alias blso='bun outdated'
  alias brm='pnpm remove'

  # equivalent of `npm ci`
  alias bci='rm -fr node_modules && bun install --frozen-lockfile'
fi
