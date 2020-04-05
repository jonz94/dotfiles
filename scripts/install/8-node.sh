echo 'installing node via fnm'

export PATH="$HOME/.fnm:$PATH"
eval "`fnm env --multi`"

LATEST_LTS_VERSION=`curl --silent "https://nodejs.org/en/download/" | grep data-version | head -n 1 | cut -d\" -f 6 | cut -c 2-`

fnm install ${LATEST_LTS_VERSION}

fnm alias ${LATEST_LTS_VERSION} default
