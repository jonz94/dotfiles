if [ `uname -r | grep -i ish` ]; then
  echo 'installing node via apk'
  apk add nodejs-current nodejs-current-doc npm
  exit 0
else
  echo 'installing node via fnm'

  export PATH="$HOME/.fnm:$PATH"
  eval "`fnm env`"

  fnm install --lts
fi
