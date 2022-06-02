# npm command aliases

if type npm &> /dev/null; then
  alias nci='npm ci'
  alias nid='npm i --save-dev'
  alias nis='npm i --save'
  alias nls='npm ls --depth 0'
  alias nlso='npm outdated'
  alias nr='npm run'
  alias nrm='npm uninstall'

  # Always typo nr into br...
  alias br='npm run'

  __npm_major_version () {
    npm -v | cut -d. -f1
  }

  nig () {
    if [ "$#" -eq 0 ]; then
      return 1
    fi

    if [ "$(__npm_major_version)" -ge 8 ]; then
      npm i --location=global "$@"
    else
      npm i -g "$@"
    fi
  }

  nlsg () {
    if [ "$(__npm_major_version)" -ge 8 ]; then
      npm ls --depth 0 --location=global
    else
      npm ls --depth 0 -g
    fi
  }

  nug () {
    if [ "$(__npm_major_version)" -ge 8 ]; then
      npm update --location=global "$@"
    else
      npm update -g "$@"
    fi
  }
fi
