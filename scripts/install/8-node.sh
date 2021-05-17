if [ `uname -r | grep -i ish` ]; then
  echo 'installing node via apk'
  apk add nodejs-current nodejs-current-doc npm
  exit 0
else
  echo 'installing node via fnm'

  export PATH="$HOME/.fnm:$PATH"
  eval "`fnm env`"

  fnm install --lts

  fnm alias lts-latest default

  echo 'updating npm to latest version'
  npm i -g npm@latest
fi
