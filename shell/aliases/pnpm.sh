# pnpm command aliases

if type pnpm &> /dev/null; then
  alias pnid='pnpm i --save-dev'
  alias pnis='pnpm i --save'
  alias pnlsall='pnpm ls --depth Infinity'
  alias pnlso='pnpm outdated'

  # equivalent of `npm ci`
  alias pnci='rm -fr node_modules && pnpm install --frozen-lockfile'
fi
