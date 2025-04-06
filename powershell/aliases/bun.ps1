# bun aliases
function bid { bun add --dev @args }
function bis { bun add @args }
function bls { bun pm ls }
function blsall { bun pm ls --all }
function blso { bun outdated }

# equivalent of `npm ci`
function bci {
  if (Test-Path node_modules) {
    Remove-Item -Recurse node_modules
  }

  bun install --frozen-lockfile
}
