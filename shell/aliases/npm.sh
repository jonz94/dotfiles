# npm command aliases

if type npm &> /dev/null; then
  alias nci='npm ci'
  alias nid='npm i --save-dev'
  alias nig='npm i -g'
  alias nis='npm i --save'
  alias nls='npm ls --depth 0'
  alias nlsg='npm ls --depth 0 -g'
  alias nlso='npm outdated'
  alias nr='npm run'
  alias nrm='npm uninstall'
  alias nug='npm update -g'

  # always typo nr into br...
  alias br='npm run'
fi
