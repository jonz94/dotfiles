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

# quickly install prettier related packages via yarn
function yap { yarn add --dev prettier prettier-plugin-packagejson prettier-plugin-organize-imports typescript }
