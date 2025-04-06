# pnpm aliases
function pnid { pnpm i --save-dev @args }
function pnis { pnpm i --save @args }
function pnlsall { pnpm ls --depth Infinity }
function pnlso { pnpm outdated }

# equivalent of `npm ci`
function pnci {
  if (Test-Path node_modules) {
    Remove-Item -Recurse node_modules
  }

  pnpm install --frozen-lockfile
}
