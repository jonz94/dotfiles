# yarn aliases

# equivalent of `npm ci`
function yci {
  if (Test-Path node_modules) {
    Remove-Item -Recurse node_modules
  }

  yarn install --frozen-lockfile
}
