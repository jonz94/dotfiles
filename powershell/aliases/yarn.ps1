# yarn aliases
function ya { yarn add @args }
function yad { yarn add --dev @args }
function ylso { yarn outdated }
function yr { yarn run @args }
function yrm { yarn remove @args }

# equivalent of `npm ci`
function yci {
  rimraf node_modules
  yarn install --frozen-lockfile
}
