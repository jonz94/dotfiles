# yarn aliases
function ya { yarn add }
function yad { yarn add --dev }
function ylso { yarn outdated }
function yr { yarn run }
function yrm { yarn remove }

# equivalent of `npm ci`
function yci {
  rimraf node_modules
  yarn install --frozen-lockfile
}
