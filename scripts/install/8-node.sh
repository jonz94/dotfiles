echo 'installing node via fnm'

export PATH="$HOME/.fnm:$PATH"
eval "`fnm env`"

fnm install --lts
