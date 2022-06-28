# pnpm aliases
function pnid { pnpm i --save-dev @args }
function pnis { pnpm i --save @args }
function pnlsall { pnpm ls --depth Infinity }
function pnlso { pnpm outdated }
function pnrm { pnpm remove @args }

# equivalent of `npm ci`
function pnci {
  rimraf node_modules
  pnpm install --frozen-lockfile
}
