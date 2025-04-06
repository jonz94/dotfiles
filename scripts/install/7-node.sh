echo 'installing node...'

if [ $(uname -r | grep -i ish) ]; then
  echo 'installing node via apk'
  apk add nodejs-current nodejs-current-doc npm
  exit 0
fi

echo 'installing node via fnm'

export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env)"

fnm install --lts

fnm alias lts-latest default

echo 'updating npm to latest version'
npm i -g npm@latest

echo 'removing global corepack package'
npm rm -g corepack

echo 'installing global npm packages: @antfu/ni, pnpm, yarn'
npm i -g @antfu/ni pnpm@latest yarn@latest
