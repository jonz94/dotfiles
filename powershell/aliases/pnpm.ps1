# pnpm aliases
function pnci { pnpm ci }
function pnid { pnpm i --save-dev @args }
function pnis { pnpm i --save @args }
function pnlsall { pnpm ls --depth Infinity }
function pnlso { pnpm outdated }
function pnrm { pnpm remove @args }

# quickly install prettier related packages via pnpm
function pnip { pnpm install --save-dev prettier prettier-plugin-packagejson prettier-plugin-organize-imports typescript }
