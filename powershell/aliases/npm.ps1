# npm aliases
function nci { npm ci }
function nid { npm install --save-dev @args }
function nig { npm install -g @args }
function nis { npm install --save @args }
function nls { npm ls --depth 0 }
function nlsg { npm ls --depth 0 -g }
function nlso { npm outdated }
function nr { npm run @args }
function nrm { npm uninstall @args }

# always typo br
function br { npm run @args }

# quickly install prettier related packages via npm
function nip { npm install --save-dev prettier prettier-plugin-packagejson prettier-plugin-organize-imports typescript }
