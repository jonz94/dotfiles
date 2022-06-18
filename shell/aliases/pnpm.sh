# pnpm command aliases

if type pnpm &> /dev/null; then
  alias pid='pnpm i --save-dev'
  alias pis='pnpm i --save'
  alias plsall='pnpm ls --depth Infinity'
  alias plso='pnpm outdated'
  alias prm='pnpm remove'
fi
